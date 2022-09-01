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
 * 角色管理控制器
 *
 * @author 王渔
 * @date 2022/8/10 16:20
 */
@RestController
@Api(tags = "RoleController")
@RequestMapping("/role")
public class UmsRoleController {

    @Resource
    private UmsRoleService umsRoleService;

    @ApiOperation("获取所有角色")
    @GetMapping("/listAll")
    @ResponseBody
    public CommonResult<List<UmsRole>> listAll() {
        List<UmsRole> roleList = umsRoleService.list();
        return CommonResult.success(roleList);
    }

    @ApiOperation("修改角色")
    @PostMapping( "/update/{id}")
    @ResponseBody
    public CommonResult update(@PathVariable Long id, @RequestBody UmsRole role) {
        int count = umsRoleService.update(id, role);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }
}