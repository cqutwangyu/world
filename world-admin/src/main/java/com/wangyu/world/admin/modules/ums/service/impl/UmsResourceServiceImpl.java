package com.wangyu.world.admin.modules.ums.service.impl;

import com.wangyu.world.admin.modules.ums.entity.UmsResource;
import com.wangyu.world.admin.modules.ums.repository.UmsResourceRepository;
import com.wangyu.world.admin.modules.ums.service.UmsResourceService;
import com.wangyu.world.common.constant.AuthConstant;
import com.wangyu.world.common.service.RedisService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

/**
 * 后台资源管理Service实现类
 * Created by macro on 2020/2/2.
 */
@Service
public class UmsResourceServiceImpl implements UmsResourceService {

    @Resource
    private UmsResourceRepository umsResourceRepository;
    @Resource
    private RedisService redisService;
    @Value("${spring.application.name}")
    private String applicationName;

    @Override
    public int create(UmsResource umsResource) {
        umsResource.setCreateTime(new Date());
        umsResourceRepository.save(umsResource);
        initResourceRolesMap();
        return 1;
    }

    @Override
    public int update(Long id, UmsResource umsResource) {
        umsResource.setId(id);
        umsResourceRepository.save(umsResource);
        initResourceRolesMap();
        return 1;
    }

    @Override
    public UmsResource getItem(Long id) {
        return umsResourceRepository.findById(id).get();
    }

    @Override
    public int delete(Long id) {
        umsResourceRepository.deleteById(id);
        initResourceRolesMap();
        return 1;
    }

    @Override
    public List<UmsResource> list(Long categoryId, String nameKeyword, String urlKeyword, Integer pageSize, Integer pageNum) {
        Pageable pageable = Pageable.ofSize(2).withPage(1);
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("name", m -> m.contains())
                .withMatcher("url", m -> m.contains());
        Example<UmsResource> example = Example.of(UmsResource.builder()
                .categoryId(categoryId).name(nameKeyword).url(urlKeyword).build(), matcher);
        return umsResourceRepository.findAll(example, pageable).toList();
    }

    @Override
    public List<UmsResource> listAll() {
        return umsResourceRepository.findAll();
    }

    @Override
    public Map<String, List<String>> initResourceRolesMap() {
        Map<String, List<String>> resourceRoleMap = new TreeMap<>();
        List<UmsResource> resourceList = umsResourceRepository.findAll();
        for (UmsResource resource : resourceList) {
            List<String> roleNames = resource.getUmsRoles().stream().map(i -> i.getId() + "_" + i.getName()).collect(Collectors.toList());
            resourceRoleMap.put("/" + applicationName + resource.getUrl(), roleNames);
        }
        redisService.del(AuthConstant.RESOURCE_ROLES_MAP_KEY);
        redisService.hSetAll(AuthConstant.RESOURCE_ROLES_MAP_KEY, resourceRoleMap);
        return resourceRoleMap;

    }
}
