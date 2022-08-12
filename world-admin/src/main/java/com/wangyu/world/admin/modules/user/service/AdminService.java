package com.wangyu.world.admin.modules.user.service;

import com.wangyu.world.admin.modules.user.dto.AdminParam;
import com.wangyu.world.admin.modules.user.entity.AdminEntity;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 14:07
 */
public interface AdminService {
   AdminEntity register(AdminParam adminParam);
}
