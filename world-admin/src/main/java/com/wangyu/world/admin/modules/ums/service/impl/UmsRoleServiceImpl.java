package com.wangyu.world.admin.modules.ums.service.impl;

import com.wangyu.world.admin.modules.ums.entity.UmsAdmin;
import com.wangyu.world.admin.modules.ums.entity.UmsMenu;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import com.wangyu.world.admin.modules.ums.repository.UmsMenuRepository;
import com.wangyu.world.admin.modules.ums.repository.UmsRoleRepository;
import com.wangyu.world.admin.modules.ums.service.UmsRoleService;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Pageable;
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

    @Resource
    private UmsRoleRepository umsRoleRepository;

    @Override
    public List<UmsMenu> getMenuList(Long id) {
        return umsMenuRepository.listByUmsAdminId(id);
    }

    @Override
    public List<UmsRole> list() {
        return umsRoleRepository.findAll();
    }

    @Override
    public Integer update(Long id, UmsRole role) {
        return null;
    }

    @Override
    public List<UmsRole> list(String keyword, Integer pageSize, Integer pageNum) {
        ExampleMatcher matcher = ExampleMatcher.matching().withMatcher("name", m -> m.caseSensitive().contains());
        Example<UmsRole> example = Example.of(UmsRole.builder().name(keyword).build(), matcher);
        return umsRoleRepository.findAll(example, Pageable.ofSize(pageSize).withPage(pageNum - 1)).getContent();
    }

    @Override
    public Integer create(UmsRole role) {
        role.setAdminCount(0);
        role.setSort(0);
        umsRoleRepository.save(role);
        return 1;
    }
}
