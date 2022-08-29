package com.wangyu.world.admin.modules.ums.service.impl;

import com.wangyu.world.admin.modules.ums.entity.UmsMenu;
import com.wangyu.world.admin.modules.ums.repository.UmsMenuRepository;
import com.wangyu.world.admin.modules.ums.service.UmsRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/23 10:28
 */
@Service
public class UmsRoleServiceImpl implements UmsRoleService {

    @Resource
    private UmsMenuRepository umsMenuRepository;

    @Override
    public List<UmsMenu> getMenuList(Long id) {
        return umsMenuRepository.listByUmsAdminId(id);
    }
}
