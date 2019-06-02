package com.ruoyi.record.domain;

import com.ruoyi.item.domain.ServiceIngredients;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 服务对应下料记录表 st_si_record
 * 
 * @author ruoyi
 * @date 2019-04-01
 */
public class StSiRecord extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 记录服务和配料 */
	private Long rsiId;
	/** 服务id */
	private Long stId;
	/** 服务配料id */
	private Long siId;
	/** 创建时间 */
	private Date createTime;
	/** 配料名称*/
	private String peiName;
	/** 服务项名称*/
	private String itemName;

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getPeiName() {
		return peiName;
	}

	public void setPeiName(String peiName) {
		this.peiName = peiName;
	}

	@Override
	public Date getCreateTime() {
		return createTime;
	}

	@Override
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/** 使用量*/
	private  Long num;
	/**使用个数*/
	private  Long siIdNum;

	public Long getNum() {
		return num;
	}

	public void setNum(Long num) {
		this.num = num;
	}

	public Long getSiIdNum() {
		return siIdNum;
	}

	public void setSiIdNum(Long siIdNum) {
		this.siIdNum = siIdNum;
	}

	private ServiceIngredients serviceIngredients;

	public ServiceIngredients getServiceIngredients() {
		return serviceIngredients;
	}

	public void setServiceIngredients(ServiceIngredients serviceIngredients) {
		this.serviceIngredients = serviceIngredients;
	}

	public void setRsiId(Long rsiId)
	{
		this.rsiId = rsiId;
	}

	public Long getRsiId() 
	{
		return rsiId;
	}
	public void setStId(Long stId) 
	{
		this.stId = stId;
	}

	public Long getStId() 
	{
		return stId;
	}
	public void setSiId(Long siId) 
	{
		this.siId = siId;
	}

	public Long getSiId() 
	{
		return siId;
	}


    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("rsiId", getRsiId())
            .append("stId", getStId())
            .append("siId", getSiId())
			.append("createTime", getCreateTime())
            .toString();
    }
}
