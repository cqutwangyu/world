package com.wangyu.world.admin.modules.ums.repository;

import com.wangyu.world.admin.modules.base.repository.BaseRepository;
import com.wangyu.world.admin.modules.ums.entity.UmsAdminLoginLog;
import com.wangyu.world.admin.modules.ums.entity.UmsRole;
import org.springframework.data.jpa.repository.Query;

import javax.management.relation.Role;
import java.util.List;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 15:36
 */
public interface UmsRoleRepository extends BaseRepository<UmsRole, Long> {
    @Query(value = "select * from ums_role ur inner join ums_admins_roles uar on ur.id = uar.role_id where uar.admin_id = ?",
    nativeQuery = true)
    List<UmsRole> listUmsRoleByUmsAdminId(Long adminId);
}
