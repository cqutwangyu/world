package com.wangyu.world.admin.modules.ums.service;

import com.wangyu.world.admin.modules.ums.dto.UmsAdminParam;
import com.wangyu.world.admin.modules.ums.entity.UmsAdmin;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import com.wangyu.world.common.api.CommonResult;
import com.wangyu.world.common.domain.UserDto;
import io.swagger.models.auth.In;

import java.util.List;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 14:07
 */
public interface UmsAdminService {
    UmsAdmin register(UmsAdminParam umsAdminParam);

    UmsAdmin getAdminByUsername(String username);

    CommonResult login(String username, String password);

    UserDto loadUserByUsername(String username);

    UmsAdmin getCurrentAdmin();

    UmsAdminCacheService getCacheService();

    List<UmsRole> getRoleList(Long id);

    List<UmsAdmin> list(String keyword, Integer pageSize, Integer pageNum);

    Integer update(Long id, UmsAdmin admin);

    Integer updateRole(Long adminId, List<Long> roleIds);

    Integer delete(Long id);
}
