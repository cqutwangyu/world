package com.wangyu.world.admin.modules.ums.controller;

import cn.hutool.core.collection.CollUtil;
import com.wangyu.world.admin.modules.ums.dto.UmsAdminParam;
import com.wangyu.world.admin.modules.ums.entity.UmsAdmin;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import com.wangyu.world.admin.modules.ums.service.UmsAdminService;
import com.wangyu.world.admin.modules.ums.service.UmsRoleService;
import com.wangyu.world.common.api.CommonResult;
import com.wangyu.world.common.domain.UserDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 用户管理控制器
 *
 * @author 王渔
 * @date 2022/8/10 16:20
 */
@RestController
@Api(tags = "UserController")
@RequestMapping("/admin")
public class UmsAdminController {

    @Resource
    private UmsAdminService umsAdminService;

    @Resource
    private UmsRoleService umsRoleService;

    @ApiOperation(value = "用户注册")
    @PostMapping("/register")
    @ResponseBody
    public CommonResult<UmsAdmin> register(@Validated @RequestBody UmsAdminParam umsAdminParam) {
        UmsAdmin umsAdmin = umsAdminService.register(umsAdminParam);
        if (umsAdmin == null) {
            return CommonResult.failed();
        }
        return CommonResult.success(umsAdmin);
    }

    @ApiOperation(value = "登录以后返回token")
    @PostMapping("/login")
    @ResponseBody
    public CommonResult login(@Validated @RequestBody UmsAdminParam umsAdminParam) {
        return umsAdminService.login(umsAdminParam.getUsername(), umsAdminParam.getPassword());
    }

    @ApiOperation("根据用户名获取通用用户信息")
    @GetMapping("/loadByUsername")
    @ResponseBody
    public UserDto loadUserByUsername(@RequestParam String username) {
        UserDto userDTO = umsAdminService.loadUserByUsername(username);
        return userDTO;
    }

    @ApiOperation("获取当前登录用户信息")
    @GetMapping("/info")
    @ResponseBody
    public CommonResult getAdminInfo() {
        UmsAdmin umsAdmin = umsAdminService.getCurrentAdmin();
        Map<String, Object> data = new HashMap<>();
        data.put("username", umsAdmin.getUsername());
        data.put("menus", umsRoleService.getMenuList(umsAdmin.getId()));
        data.put("icon", umsAdmin.getIcon());
        List<UmsRole> roleList = umsAdminService.getRoleList(umsAdmin.getId());
        if (CollUtil.isNotEmpty(roleList)) {
            List<String> roles = roleList.stream().map(UmsRole::getName).collect(Collectors.toList());
            data.put("roles", roles);
        }
        return CommonResult.success(data);
    }

    @ApiOperation("登出功能")
    @PostMapping("/logout")
    @ResponseBody
    public CommonResult logout() {
        return CommonResult.success(null);
    }
}
