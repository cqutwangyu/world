package com.wangyu.world.admin.modules.ums.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.BCrypt;
import cn.hutool.extra.spring.SpringUtil;
import cn.hutool.json.JSONUtil;
import com.wangyu.world.admin.modules.feign.AuthService;
import com.wangyu.world.admin.modules.ums.dto.UmsAdminParam;
import com.wangyu.world.admin.modules.ums.entity.UmsAdmin;
import com.wangyu.world.admin.modules.ums.entity.UmsAdminLoginLog;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import com.wangyu.world.admin.modules.ums.repository.UmsAdminLoginLogRepository;
import com.wangyu.world.admin.modules.ums.repository.UmsAdminRepository;
import com.wangyu.world.admin.modules.ums.repository.UmsRoleRepository;
import com.wangyu.world.admin.modules.ums.service.UmsAdminCacheService;
import com.wangyu.world.admin.modules.ums.service.UmsAdminService;
import com.wangyu.world.common.api.CommonResult;
import com.wangyu.world.common.api.ResultCode;
import com.wangyu.world.common.constant.AuthConstant;
import com.wangyu.world.common.domain.UserDto;
import com.wangyu.world.common.exception.Asserts;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 14:07
 */
@Service
public class UmsAdminServiceImpl implements UmsAdminService {

    @Resource
    private UmsAdminRepository umsAdminRepository;
    @Resource
    private UmsAdminLoginLogRepository umsAdminLoginLogRepository;
    @Resource
    private UmsRoleRepository umsRoleRepository;
    @Resource
    private AuthService authService;
    @Resource
    private HttpServletRequest request;

    @Override
    public UmsAdmin register(UmsAdminParam umsAdminParam) {
        UmsAdmin umsAdmin = new UmsAdmin();
        BeanUtils.copyProperties(umsAdminParam, umsAdmin);
        boolean exist = umsAdminRepository.existsByUsername(umsAdmin.getUsername());
        if (exist) {
            return null;
        }
        //加密
        String encodePassword = BCrypt.hashpw(umsAdmin.getPassword());
        umsAdmin.setPassword(encodePassword);
        umsAdminRepository.save(umsAdmin);
        return umsAdmin;
    }

    @Override
    public UmsAdmin getAdminByUsername(String username) {
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("username", ExampleMatcher.GenericPropertyMatchers.startsWith());
        Example<UmsAdmin> example = Example.of(UmsAdmin.builder().username(username).build(), matcher);
        Optional<UmsAdmin> adminEntity = umsAdminRepository.findOne(example);
        if (adminEntity.isPresent()) {
            return adminEntity.get();
        }
        return null;
    }

    @Override
    public CommonResult login(String username, String password) {
        if (StrUtil.isEmpty(username) || StrUtil.isEmpty(password)) {
            Asserts.fail("用户名或密码不能为空！");
        }
        Map<String, String> params = new HashMap<>();
        params.put("client_id", AuthConstant.ADMIN_CLIENT_ID);
        params.put("client_secret", "123456");
        params.put("grant_type", "password");
        params.put("username", username);
        params.put("password", password);
        CommonResult restResult = authService.getAccessToken(params);
        if (ResultCode.SUCCESS.getCode() == restResult.getCode() && restResult.getData() != null) {
            insertLoginLog(username);
            UmsAdmin userAdmin = umsAdminRepository.findByUsername(username);
            userAdmin.setLoginTime(new Date());
            umsAdminRepository.save(userAdmin);
        }
        return restResult;
    }

    @Override
    public UserDto loadUserByUsername(String username) {
        //获取用户信息
        UmsAdmin admin = getAdminByUsername(username);
        if (admin != null) {
            List<UmsRole> roleList = admin.getUmsRoles();
            UserDto userDTO = new UserDto();
            BeanUtils.copyProperties(admin, userDTO);
            if (CollUtil.isNotEmpty(roleList)) {
                List<String> roleStrList = roleList.stream().map(item -> item.getId() + "_" + item.getName()).collect(Collectors.toList());
                userDTO.setRoles(roleStrList);
            }
            return userDTO;
        }
        return null;
    }

    @Override
    public UmsAdmin getCurrentAdmin() {
        String userStr = request.getHeader(AuthConstant.USER_TOKEN_HEADER);
        if (StrUtil.isEmpty(userStr)) {
            Asserts.fail(ResultCode.UNAUTHORIZED);
        }
        UserDto userDto = JSONUtil.toBean(userStr, UserDto.class);
        UmsAdmin admin = getCacheService().getAdmin(userDto.getId());
        if (admin != null) {
            return admin;
        } else {
            admin = umsAdminRepository.findById(userDto.getId()).get();
            getCacheService().setAdmin(admin);
            return admin;
        }
    }

    /**
     * 添加登录记录
     *
     * @param username 用户名
     */
    private void insertLoginLog(String username) {
        UmsAdmin admin = getAdminByUsername(username);
        if (admin == null) return;
        UmsAdminLoginLog loginLog = new UmsAdminLoginLog();
        loginLog.setAdminId(admin.getId());
        loginLog.setCreateTime(new Date());
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        loginLog.setIp(request.getRemoteAddr());
        umsAdminLoginLogRepository.save(loginLog);
    }

    @Override
    public UmsAdminCacheService getCacheService() {
        return SpringUtil.getBean(UmsAdminCacheService.class);
    }

    @Override
    public List<UmsRole> getRoleList(Long id) {
        return umsRoleRepository.listUmsRoleByUmsAdminId(id);
    }

    @Override
    public List<UmsAdmin> list(String keyword, Integer pageSize, Integer pageNum) {
        ExampleMatcher matcher = ExampleMatcher.matching().withMatcher("username", m -> m.caseSensitive().contains());
        Example<UmsAdmin> example = Example.of(UmsAdmin.builder().username(keyword).build(), matcher);
        return umsAdminRepository.findAll(example, Pageable.ofSize(pageSize).withPage(pageNum - 1)).getContent();
    }

    @Override
    public Integer update(Long id, UmsAdmin admin) {
        UmsAdmin umsAdmin = umsAdminRepository.findById(id).get();
        if (admin.getEmail() != null) {
            umsAdmin.setEmail(admin.getEmail());
        }
        if (admin.getNickName() != null) {
            umsAdmin.setNickName(admin.getNickName());
        }
        if (admin.getNote() != null) {
            umsAdmin.setNote(admin.getNote());
        }
        if (admin.getStatus() != null) {
            umsAdmin.setStatus(admin.getStatus());
        }
        if (admin.getPassword() != null && !admin.getPassword().equals(umsAdmin.getPassword())) {
            umsAdmin.setPassword(BCrypt.hashpw(umsAdmin.getPassword()));
        }
        umsAdminRepository.save(umsAdmin);
        return 1;
    }

    @Override
    public Integer updateRole(Long adminId, List<Long> roleIds) {
        UmsAdmin umsAdmin = umsAdminRepository.findById(adminId).get();
        if (umsAdmin == null) {
            return 0;
        }
        List<UmsRole> roles = umsRoleRepository.findAllById(roleIds);
        umsAdmin.setUmsRoles(roles);
        umsAdminRepository.save(umsAdmin);
        return 1;
    }

    @Override
    public Integer delete(Long id) {
        umsAdminRepository.deleteById(id);
        return 1;
    }
}
