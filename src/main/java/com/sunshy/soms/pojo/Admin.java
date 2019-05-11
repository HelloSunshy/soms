package com.sunshy.soms.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   15:38
 */
@Data
@Entity
public class Admin {

    @Id
    private Integer id;

    private String adminUsername;

    private String adminPassword;

}
