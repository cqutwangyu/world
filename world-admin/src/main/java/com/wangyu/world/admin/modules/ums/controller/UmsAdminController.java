package com.wangyu.world.admin.modules.ums.controller;

import cn.hutool.core.collection.CollUtil;
import com.wangyu.world.admin.modules.ums.dto.UmsAdminParam;
import com.wangyu.world.admin.modules.ums.entity.UmsAdmin;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import com.wangyu.world.admin.modules.ums.service.UmsAdminService;
import com.wangyu.world.admin.modules.ums.service.UmsRoleService;
import com.wangyu.world.common.api.CommonPage;
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
            return CommonResult.failed("用户名已存在");
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

    @ApiOperation("根据用户名或姓名分页获取用户列表")
    @GetMapping("/list")
    @ResponseBody
    public CommonResult<CommonPage<UmsAdmin>> list(@RequestParam(value = "keyword", required = false) String keyword,
                                                   @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                   @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<UmsAdmin> adminList = umsAdminService.list(keyword, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(adminList));
    }

    @ApiOperation("删除指定用户信息")
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public CommonResult delete(@PathVariable Long id) {
        int count = umsAdminService.delete(id);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("修改帐号状态")
    @PostMapping("/updateStatus/{id}")
    @ResponseBody
    public CommonResult updateStatus(@PathVariable Long id,@RequestParam(value = "status") Integer status) {
        UmsAdmin umsAdmin = new UmsAdmin();
        umsAdmin.setStatus(status);
        int count = umsAdminService.update(id,umsAdmin);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("修改指定用户信息")
    @PostMapping("/update/{id}")
    @ResponseBody
    public CommonResult update(@PathVariable Long id, @RequestBody UmsAdmin admin) {
        int count = umsAdminService.update(id, admin);
        if (count == 1) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("获取指定用户的角色")
    @GetMapping("/role/{adminId}")
    @ResponseBody
    public CommonResult<List<UmsRole>> getRoleList(@PathVariable Long adminId) {
        List<UmsRole> roleList = umsAdminService.getRoleList(adminId);
        return CommonResult.success(roleList);
    }

    @ApiOperation("给用户分配角色")
    @PostMapping("/role/update")
    @ResponseBody
    public CommonResult updateRole(@RequestParam("adminId") Long adminId,
                                   @RequestParam("roleIds") List<Long> roleIds) {
        int count = umsAdminService.updateRole(adminId, roleIds);
        if (count >= 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }
}
