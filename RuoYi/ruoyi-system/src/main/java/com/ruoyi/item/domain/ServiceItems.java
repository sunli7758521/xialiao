package com.ruoyi.item.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 服务项表 service_items
 * 
 * @author ruoyi
 * @date 2019-03-26
 */
public class ServiceItems extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 服务项主键 */
	private Long siId;
	/** 父id */
	private String deptId;
	/** 祖级列表 */
	private String ancestors;
	/** 服务项名称 */
	private String siName;
	/** 显示顺序 */
	private Integer orderNum;
	/** 服务项状态（0正常 1停用） */
	private String status;
	/** 创建时间 */
	private Date createTime;
	/** 修改时间 */
	private Date updateTime;
	/** 部门名称*/
	private String deptName;

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public void setSiId(Long siId)
	{
		this.siId = siId;
	}

	public Long getSiId() 
	{
		return siId;
	}

	public void setAncestors(String ancestors) 
	{
		this.ancestors = ancestors;
	}

	public String getAncestors() 
	{
		return ancestors;
	}
	public void setSiName(String siName) 
	{
		this.siName = siName;
	}

	public String getSiName() 
	{
		return siName;
	}
	public void setOrderNum(Integer orderNum) 
	{
		this.orderNum = orderNum;
	}

	public Integer getOrderNum() 
	{
		return orderNum;
	}
	public void setStatus(String status) 
	{
		this.status = status;
	}

	public String getStatus() 
	{
		return status;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}
	public void setUpdateTime(Date updateTime) 
	{
		this.updateTime = updateTime;
	}

	public Date getUpdateTime() 
	{
		return updateTime;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("siId", getSiId())
            .append("deptId", getDeptId())
            .append("ancestors", getAncestors())
            .append("siName", getSiName())
            .append("orderNum", getOrderNum())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
