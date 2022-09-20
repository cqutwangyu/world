package com.wangyu.world.admin.modules.ums.service;

import com.wangyu.world.admin.modules.ums.entity.UmsMenu;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import io.swagger.models.auth.In;

import java.util.List;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/23 10:28
 */
public interface UmsRoleService {
    List<UmsMenu> getMenuList(Long id);

    List<UmsRole> list();

    Integer update(Long id, UmsRole role);

    List<UmsRole> list(String keyword, Integer pageSize, Integer pageNum);

    Integer create(UmsRole role);
}
