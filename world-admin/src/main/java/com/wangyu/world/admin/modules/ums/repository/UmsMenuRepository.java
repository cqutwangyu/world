package com.wangyu.world.admin.modules.ums.repository;

import com.wangyu.world.admin.modules.base.repository.BaseRepository;
import com.wangyu.world.admin.modules.ums.entity.UmsMenu;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 15:36
 */
public interface UmsMenuRepository extends BaseRepository<UmsMenu, Long> {

    @Query(value = "SELECT * FROM ums_menu um INNER JOIN ums_roles_menus urm ON um.id = urm.menu_id INNER JOIN ums_admins_roles uar ON urm.role_id = uar.role_id where uar.admin_id = ?",
            nativeQuery = true)
    List<UmsMenu> listByUmsAdminId(Long adminId);
}
