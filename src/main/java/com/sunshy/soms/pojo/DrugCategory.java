package com.sunshy.soms.pojo;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   15:48
 */
@Data
@Entity
@DynamicUpdate
public class DrugCategory {

    @Id
    private String drugCategoryId;

    private String drugCategoryName;

    private String drugCategoryType;



    @Column(name="createtime")
    private Date createTime;

    @Column(name="updatetime")
    private Date updateTime;

}
