package com.sunshy.soms.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-22   20:29
 */
@Data
@Entity
public class Symptom {


    @Id
    private Integer SymptomId;

    private String notesName;

}
