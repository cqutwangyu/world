package com.wangyu.world.admin.modules.ums.entity;

import com.wangyu.world.admin.modules.base.entity.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "ums_admin_login_log")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UmsAdminLoginLog extends BaseEntity implements Serializable {

    private Long adminId;

    private Date createTime;

    private String ip;

    private String address;

    @ApiModelProperty(value = "浏览器登录类型")
    private String userAgent;

    private static final long serialVersionUID = 1L;

}