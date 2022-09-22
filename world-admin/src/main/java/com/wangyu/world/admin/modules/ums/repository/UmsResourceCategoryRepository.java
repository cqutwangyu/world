package com.wangyu.world.admin.modules.ums.repository;

import com.wangyu.world.admin.modules.base.repository.BaseRepository;
import com.wangyu.world.admin.modules.ums.entity.UmsResourceCategory;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 15:36
 */
public interface UmsResourceCategoryRepository extends BaseRepository<UmsResourceCategory, Long> {

}
