package com.wangyu.world.admin.modules.ums.entity;

import com.wangyu.world.admin.modules.base.entity.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * todo desc
 *
 * @author 王渔
 * @date 2022/9/20 16:52
 */
@Entity
@Table(name = "ums_resource_category")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UmsResourceCategory extends BaseEntity {

    @ApiModelProperty(value = "分类名称")
    private String name;

    @ApiModelProperty(value = "排序")
    private Integer sort;

}
