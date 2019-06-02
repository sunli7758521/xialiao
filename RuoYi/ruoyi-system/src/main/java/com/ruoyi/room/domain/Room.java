package com.ruoyi.room.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 美容房间表 room
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
public class Room extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 主键 */
	private Long roId;
	/** 房间 名称 */
	private String roName;
	/** 房间使用状态 0 使用中  1 未使用 */
	private String state;
	/** 房间创建时间 */
	private Date createTime;

	/** 部门id  */
	private Long deptId;

	/** 部门名称 */
	private String deptName;

	/** 房间的占用时间*/
	private String rzyTime;



	public String getRzyTime() {
		return rzyTime;
	}

	public void setRzyTime(String rzyTime) {
		this.rzyTime = rzyTime;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public void setRoId(Long roId)
	{
		this.roId = roId;
	}

	public Long getRoId() 
	{
		return roId;
	}
	public void setRoName(String roName) 
	{
		this.roName = roName;
	}

	public String getRoName() 
	{
		return roName;
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

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roId", getRoId())
            .append("roName", getRoName())
            .append("state", getState())
            .append("createTime", getCreateTime())
			.append("deptId", getDeptId())
			.append("rzyTime", getRzyTime())
            .toString();
    }
}
