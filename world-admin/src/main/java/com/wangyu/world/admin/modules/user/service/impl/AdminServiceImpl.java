package com.wangyu.world.admin.modules.user.service.impl;

import com.wangyu.world.admin.modules.user.dto.AdminParam;
import com.wangyu.world.admin.modules.user.entity.AdminEntity;
import com.wangyu.world.admin.modules.user.repository.AdminRepository;
import com.wangyu.world.admin.modules.user.service.AdminService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/8/11 14:07
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminRepository adminCrudRepository;

    @Override
    public AdminEntity register(AdminParam adminParam) {
        AdminEntity adminEntity = new AdminEntity();
        BeanUtils.copyProperties(adminParam, adminEntity);
        adminCrudRepository.save(adminEntity);
        return adminEntity;
    }
}
