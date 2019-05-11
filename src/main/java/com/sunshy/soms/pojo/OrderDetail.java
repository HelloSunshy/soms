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
 * @date 2019-04-10   15:40
 */
@Data
@Entity
@DynamicUpdate
public class OrderDetail {

    @Id
    private String orderDetailId;

    private String orderMasterId;

    private String drugId;

    private String drugName;

    private BigDecimal orderDetailPrice;

    private Integer drugQuentily;

    private Integer orderDetailStatus;

    @Column(name = "createtime")
    private Date createTime;

    @Column(name = "updatetime")
    private Date updateTime;

}
