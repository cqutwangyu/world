package com.wangyu.world.admin.modules.ums.service.impl;

import com.wangyu.world.admin.modules.ums.entity.UmsResource;
import com.wangyu.world.admin.modules.ums.entity.UmsResourceCategory;
import com.wangyu.world.admin.modules.ums.repository.UmsResourceCategoryRepository;
import com.wangyu.world.admin.modules.ums.service.UmsResourceCategoryService;
import com.wangyu.world.admin.utils.JpaUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/9/22 9:35
 */
@Service
public class UmsResourceCategoryServiceImpl implements UmsResourceCategoryService {

    @Resource
    private UmsResourceCategoryRepository umsResourceCategoryRepository;

    @Override
    public List<UmsResourceCategory> listAll() {
        return umsResourceCategoryRepository.findAll();
    }

    @Override
    public int create(UmsResourceCategory umsResourceCategory) {
        umsResourceCategoryRepository.save(umsResourceCategory);
        return 1;
    }

    @Override
    public int update(Long id, UmsResourceCategory umsResourceCategory) {
        UmsResourceCategory category = umsResourceCategoryRepository.findById(id).get();
        if (category == null) {
            return 0;
        }
        JpaUtil.copyNotNullProperties(umsResourceCategory, category);
        umsResourceCategoryRepository.save(category);
        return 1;
    }

    @Override
    public int delete(Long id) {
        umsResourceCategoryRepository.deleteById(id);
        return 1;
    }
}
