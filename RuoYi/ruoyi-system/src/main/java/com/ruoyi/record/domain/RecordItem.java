package com.ruoyi.record.domain;

import java.util.Date;

/**
 * @Author sunli
 * @Date 2019/3/30
 */
public class RecordItem {

    /** 记录主键 */
    private Long srId;
    /** 顾客名称 */
    private String gkName;
    /** 顾客编号 */
    private String gkNum;
    /** 房间主键 */
    private Long roomId;
    /** 房间占用时间 0.5 -5个小时 0，1，2，3，4，5，6，7，8，9，1 */
    private String roomTime;
    /** 美容师id */
    private Long mrsId;
    /** 顾问id */
    private Long gwId;

    /** 0，顾问开单状态 1.物料确认状态 2.美容师确认   */
    private String state;
    /** 开单时间 */
    private Date createTime;
    /** 备注 */
    private String remark;
    /** 服务项id1 */
    private Long siId1;
    /** 服务项id1 */
    private Long siId2;
    /** 服务项id1 */
    private Long siId3;
    /** 配料 1*/
    private String a;
    /** 配料 2*/
    private String b;
    /** 配料 3*/
    private String c;

    public Long getSrId() {
        return srId;
    }

    public void setSrId(Long srId) {
        this.srId = srId;
    }

    public String getGkName() {
        return gkName;
    }

    public void setGkName(String gkName) {
        this.gkName = gkName;
    }

    public String getGkNum() {
        return gkNum;
    }

    public void setGkNum(String gkNum) {
        this.gkNum = gkNum;
    }

    public Long getRoomId() {
        return roomId;
    }

    public void setRoomId(Long roomId) {
        this.roomId = roomId;
    }

    public String getRoomTime() {
        return roomTime;
    }

    public void setRoomTime(String roomTime) {
        this.roomTime = roomTime;
    }

    public Long getMrsId() {
        return mrsId;
    }

    public void setMrsId(Long mrsId) {
        this.mrsId = mrsId;
    }

    public Long getGwId() {
        return gwId;
    }

    public void setGwId(Long gwId) {
        this.gwId = gwId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getSiId1() {
        return siId1;
    }

    public void setSiId1(Long siId1) {
        this.siId1 = siId1;
    }

    public Long getSiId2() {
        return siId2;
    }

    public void setSiId2(Long siId2) {
        this.siId2 = siId2;
    }

    public Long getSiId3() {
        return siId3;
    }

    public void setSiId3(Long siId3) {
        this.siId3 = siId3;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    public String getB() {
        return b;
    }

    public void setB(String b) {
        this.b = b;
    }

    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c;
    }
}
