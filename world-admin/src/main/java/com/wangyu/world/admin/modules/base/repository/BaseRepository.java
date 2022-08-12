package com.wangyu.world.admin.modules.base.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 15:36
 */
@NoRepositoryBean
public interface BaseRepository<T, Long> extends JpaRepository<T, Long> {
}
