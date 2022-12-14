package com.wangyu.world.admin.modules.ums.repository;

import com.wangyu.world.admin.modules.base.repository.BaseRepository;
import com.wangyu.world.admin.modules.ums.entity.UmsAdmin;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 15:36
 */
public interface UmsAdminRepository extends BaseRepository<UmsAdmin, Long> {

    UmsAdmin findByUsername(String username);

    boolean existsByUsername(String username);

}
