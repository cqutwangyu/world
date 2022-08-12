package com.wangyu.world.admin.modules.user.controller;

import com.wangyu.world.admin.modules.user.dto.AdminParam;
import com.wangyu.world.admin.modules.user.entity.AdminEntity;
import com.wangyu.world.admin.modules.user.service.AdminService;
import com.wangyu.world.common.api.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 用户管理控制器
 *
 * @author 王渔
 * @date 2022/8/10 16:20
 */
@RestController
@Api(tags = "UserController")
@RequestMapping("/user")
public class AdminController {

    @Resource
    private AdminService adminService;

    @ApiOperation(value = "用户注册")
    @PostMapping("/register")
    @ResponseBody
    public CommonResult<AdminEntity> register(@Validated @RequestBody AdminParam adminParam) {
        AdminEntity umsAdmin = adminService.register(adminParam);
        if (umsAdmin == null) {
            return CommonResult.failed();
        }
        return CommonResult.success(umsAdmin);
    }
}
