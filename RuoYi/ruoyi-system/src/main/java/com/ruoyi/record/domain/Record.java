package com.ruoyi.record.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 美容记录表 record
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
public class Record extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
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

	/** 美容师 名称*/
	private String mrName;
	/** 顾问 名称*/
	private String gwName;
	/** 服务项1 名称*/
	private String siName;

	/** 服务项id */
	private Long siId;
	/* 配料1*/
	private String a;

	/** 服务项id */
	private Long siId2;
	/* 配料1*/
	private String b;

	/** 服务项id */
	private Long siId3;
	/* 配料1*/
	private String c;
	/** 部门 id*/
	private String deptId;

	/** 服务项1 名称*/
	private String siName2;
	/** 服务项1 名称*/
	private String siName3;
	/* 美容师确认 时间*/
	private Date endTime;
	/* 显示预计时间 */
	private Date yjTime;

	public Date getYjTime() {
		return yjTime;
	}

	public void setYjTime(Date yjTime) {
		this.yjTime = yjTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getSiName2() {
		return siName2;
	}

	public void setSiName2(String siName2) {
		this.siName2 = siName2;
	}

	public String getSiName3() {
		return siName3;
	}

	public void setSiName3(String siName3) {
		this.siName3 = siName3;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public Long getSiId2() {
		return siId2;
	}

	public void setSiId2(Long siId2) {
		this.siId2 = siId2;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public Long getSiId3() {
		return siId3;
	}

	public void setSiId3(Long siId3) {
		this.siId3 = siId3;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	/** 服务项 名称*/
	private String roomName;

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getMrName() {
		return mrName;
	}

	public void setMrName(String mrName) {
		this.mrName = mrName;
	}

	public String getGwName() {
		return gwName;
	}

	public void setGwName(String gwName) {
		this.gwName = gwName;
	}

	public String getSiName() {
		return siName;
	}

	public void setSiName(String siName) {
		this.siName = siName;
	}

	public void setSrId(Long srId)
	{
		this.srId = srId;
	}

	public Long getSrId() 
	{
		return srId;
	}
	public void setGkName(String gkName) 
	{
		this.gkName = gkName;
	}

	public String getGkName() 
	{
		return gkName;
	}
	public void setGkNum(String gkNum) 
	{
		this.gkNum = gkNum;
	}

	public String getGkNum() 
	{
		return gkNum;
	}
	public void setRoomId(Long roomId) 
	{
		this.roomId = roomId;
	}

	public Long getRoomId() 
	{
		return roomId;
	}
	public void setRoomTime(String roomTime) 
	{
		this.roomTime = roomTime;
	}

	public String getRoomTime() 
	{
		return roomTime;
	}
	public void setMrsId(Long mrsId) 
	{
		this.mrsId = mrsId;
	}

	public Long getMrsId() 
	{
		return mrsId;
	}
	public void setGwId(Long gwId) 
	{
		this.gwId = gwId;
	}

	public Long getGwId() 
	{
		return gwId;
	}
	public void setSiId(Long siId) 
	{
		this.siId = siId;
	}

	public Long getSiId() 
	{
		return siId;
	}
	public void setState(String state) 
	{
		this.state = state;
	}

	public String getState() 
	{
		return state;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}
	public void setRemark(String remark) 
	{
		this.remark = remark;
	}

	public String getRemark() 
	{
		return remark;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("srId", getSrId())
            .append("gkName", getGkName())
            .append("gkNum", getGkNum())
            .append("roomId", getRoomId())
            .append("roomTime", getRoomTime())
            .append("mrsId", getMrsId())
            .append("gwId", getGwId())
            .append("siId", getSiId())
            .append("state", getState())
            .append("createTime", getCreateTime())
            .append("remark", getRemark())
            .toString();
    }
}
