package com.wangyu.world.admin.modules.ums.service.impl;

import com.wangyu.world.admin.modules.ums.dto.UmsMenuNode;
import com.wangyu.world.admin.modules.ums.entity.UmsMenu;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import com.wangyu.world.admin.modules.ums.repository.UmsMenuRepository;
import com.wangyu.world.admin.modules.ums.service.UmsMenuService;
import com.wangyu.world.admin.utils.JpaUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/9/22 9:49
 */
@Service
public class UmsMenuServiceImpl implements UmsMenuService {

    @Resource
    private UmsMenuRepository umsMenuRepository;

    @Override
    public int create(UmsMenu umsMenu) {
        umsMenuRepository.save(umsMenu);
        return 1;
    }

    @Override
    public int update(Long id, UmsMenu umsMenu) {
        UmsMenu menu = umsMenuRepository.findById(id).get();
        if (menu == null) {
            return 0;
        }
        JpaUtil.copyNotNullProperties(umsMenu, menu);
        umsMenuRepository.save(menu);
        return 1;
    }

    @Override
    public UmsMenu getItem(Long id) {
        return umsMenuRepository.findById(id).get();
    }

    @Override
    public int delete(Long id) {
        umsMenuRepository.deleteById(id);
        return 1;
    }

    @Override
    public List<UmsMenu> list(Long parentId, Integer pageSize, Integer pageNum) {
        ExampleMatcher matcher = ExampleMatcher.matching().withMatcher("parentId", m -> m.caseSensitive().contains());
        Example<UmsMenu> example = Example.of(UmsMenu.builder().parentId(parentId).build(), matcher);
        return umsMenuRepository.findAll(example, Pageable.ofSize(pageSize).withPage(pageNum - 1)).getContent();
    }

    @Override
    public List<UmsMenuNode> treeList() {
        List<UmsMenu> menuList = umsMenuRepository.findAll();
        List<UmsMenuNode> result = menuList.stream()
                .filter(menu -> menu.getParentId().equals(0L))
                .map(menu -> covertMenuNode(menu, menuList)).collect(Collectors.toList());
        return result;
    }

    @Override
    public int updateHidden(Long id, Integer hidden) {
        UmsMenu menu = umsMenuRepository.findById(id).get();
        if (menu == null) {
            return 0;
        }
        menu.setHidden(hidden);
        umsMenuRepository.save(menu);
        return 1;
    }

    /**
     * 将UmsMenu转化为UmsMenuNode并设置children属性
     */
    private UmsMenuNode covertMenuNode(UmsMenu menu, List<UmsMenu> menuList) {
        UmsMenuNode node = new UmsMenuNode();
        BeanUtils.copyProperties(menu, node);
        List<UmsMenuNode> children = menuList.stream()
                .filter(subMenu -> subMenu.getParentId().equals(menu.getId()))
                .map(subMenu -> covertMenuNode(subMenu, menuList)).collect(Collectors.toList());
        node.setChildren(children);
        return node;
    }
}
