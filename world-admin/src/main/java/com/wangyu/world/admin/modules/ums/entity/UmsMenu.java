package com.wangyu.world.admin.modules.ums.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wangyu.world.admin.modules.base.entity.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "ums_menu")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UmsMenu extends BaseEntity implements Serializable {

    @ManyToMany(mappedBy = "umsMenus")
    @JsonIgnore
    private Set<UmsRole> umsRoles = new HashSet<>();

    @ApiModelProperty(value = "父级ID")
    private Long parentId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "菜单名称")
    private String title;

    @ApiModelProperty(value = "菜单级数")
    private Integer level;

    @ApiModelProperty(value = "菜单排序")
    private Integer sort;

    @ApiModelProperty(value = "前端名称")
    private String name;

    @ApiModelProperty(value = "前端图标")
    private String icon;

    @ApiModelProperty(value = "前端隐藏")
    private Integer hidden;

    private static final long serialVersionUID = 1L;

}