package com.wangyu.world.admin.modules.base.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.Date;

@MappedSuperclass
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BaseEntity implements Serializable {

    @Id
    @GeneratedValue
    @ApiModelProperty(value = "主键ID")
    private Long id;

    @Column(updatable = false)
    @CreationTimestamp
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @UpdateTimestamp
    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

}
