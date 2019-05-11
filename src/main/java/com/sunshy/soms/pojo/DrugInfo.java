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
 * @date 2019-04-10   15:54
 */
@Data
@Entity
@DynamicUpdate
public class DrugInfo {

    @Id
    @Column(name="drug_id")
    private String drugInfoId;

    private String drugInfoName;

    private Integer drugInfoQuenity;

    private String drugInfoType;

    private Integer drugInfoStatue;

    private BigDecimal drugInfoPrice;

    private String drugInfoDescription;

    @Column(name = "createtime")
    private Date createTime;

    @Column(name = "updatetime")
    private  Date updateTime;

}
