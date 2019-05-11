package com.sunshy.soms.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   15:28
 */
@Data
@Entity
public class UserInfo {

    @Id
    private String userId;

    private String userName;

    private Integer userSex;

    private Integer userStatue;

    private String userPassword;

    private String userUsername;

    private String userDept;

    private String userClass;

    private String userPhone;

    private String userImg;

}
