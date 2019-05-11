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
 * @date 2019-04-10   15:36
 */
@Data
@Entity
@DynamicUpdate
public class OrderMaster {

    @Id
    private String orderMasterId;

    private String doctorId;

    private String userId;

    private Integer orderStatus;

    private BigDecimal orderPrice;

    private String orderNotes;

    private Integer payStatus;

    private Integer orderStatusToup;

    private Date orderTime;

    private String orderDescription;

    @Column(name = "createtime")
    private Date createTime;

    @Column(name = "updatetime")
    private Date updateTime;

}
