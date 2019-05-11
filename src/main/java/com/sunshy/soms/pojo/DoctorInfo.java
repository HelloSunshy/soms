package com.sunshy.soms.pojo;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

/**
 * Demo Class
 *
 * @author sunshy
 *
 * @date 2019-04-10   15:30
 */
@Data
@Entity
@DynamicUpdate
public class DoctorInfo {

    @Id
    private  String doctorId;

    private  String doctorName;

    private  Integer doctorSex;

    private  String doctorUsername;

    private  String doctorNotes;

    private  String doctorPassword;

    @Column(name = "createtime")
    private  Date createTime;

    @Column(name = "updatetime")
    private  Date updateTime;


}
