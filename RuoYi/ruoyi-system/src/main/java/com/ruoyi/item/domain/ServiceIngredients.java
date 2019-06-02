package com.ruoyi.item.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 服务项配料表 service_ingredients
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
public class ServiceIngredients extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 服务配料 */
	private Long smId;
	/** 编号 */
	private String smNo;
	/** 名称 */
	private String smName;
	/** 产品单位  0克 1 毫升 2个  3滴 4 瓶  5 支  6 包  7对 8 贴  9 片 10 盒 */
	private String smUnit;
	/** 产品数量 */
	private Integer smNum;
	/** 服务项id */
	private Long stId;
	/** 创建时间 */
	private Date createTime;
	/** 备注 */
	private String remark;
	/** 服务项名称*/
	private String serviceItemName;
	/** 部门 id*/
	private Long deptId;


	/** 部门 名称 */
	private String deptName;

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

	public String getServiceItemName() {
		return serviceItemName;
	}

	public void setServiceItemName(String serviceItemName) {
		this.serviceItemName = serviceItemName;
	}

	public void setSmId(Long smId)
	{
		this.smId = smId;
	}

	public Long getSmId() 
	{
		return smId;
	}
	public void setSmNo(String smNo) 
	{
		this.smNo = smNo;
	}

	public String getSmNo() 
	{
		return smNo;
	}
	public void setSmName(String smName) 
	{
		this.smName = smName;
	}

	public String getSmName() 
	{
		return smName;
	}
	public void setSmUnit(String smUnit) 
	{
		this.smUnit = smUnit;
	}

	public String getSmUnit() 
	{
		return smUnit;
	}
	public void setSmNum(Integer smNum) 
	{
		this.smNum = smNum;
	}

	public Integer getSmNum() 
	{
		return smNum;
	}
	public void setStId(Long stId) 
	{
		this.stId = stId;
	}

	public Long getStId() 
	{
		return stId;
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
            .append("smId", getSmId())
            .append("smNo", getSmNo())
            .append("smName", getSmName())
            .append("smUnit", getSmUnit())
            .append("smNum", getSmNum())
            .append("stId", getStId())
            .append("createTime", getCreateTime())
            .append("remark", getRemark())
            .toString();
    }
}
