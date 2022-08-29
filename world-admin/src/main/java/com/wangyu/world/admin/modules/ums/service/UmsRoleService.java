package com.wangyu.world.admin.modules.ums.service;

import com.wangyu.world.admin.modules.ums.entity.UmsMenu;

import java.util.List;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/23 10:28
 */
public interface UmsRoleService {
    List<UmsMenu> getMenuList(Long id);
}
