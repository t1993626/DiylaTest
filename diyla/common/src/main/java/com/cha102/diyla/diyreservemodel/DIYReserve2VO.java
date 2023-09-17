package com.cha102.diyla.diyreservemodel;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DIYReserve2VO implements Serializable {

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date diyReserveDate;
    private int diyPeriod;
    private long peoCount;
}

