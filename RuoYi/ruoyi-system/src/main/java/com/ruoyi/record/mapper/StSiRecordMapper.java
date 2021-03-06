package com.ruoyi.record.mapper;

import com.ruoyi.record.domain.StSiRecord;
import java.util.List;	

/**
 * 服务对应下料记录 数据层
 * 
 * @author ruoyi
 * @date 2019-04-01
 */
public interface StSiRecordMapper 
{
	/**
     * 查询服务对应下料记录信息
     * 
     * @param rsiId 服务对应下料记录ID
     * @return 服务对应下料记录信息
     */
	public StSiRecord selectStSiRecordById(Long rsiId);
	
	/**
     * 查询服务对应下料记录列表
     * 
     * @param stSiRecord 服务对应下料记录信息
     * @return 服务对应下料记录集合
     */
	public List<StSiRecord> selectStSiRecordList(StSiRecord stSiRecord);
	
	/**
     * 新增服务对应下料记录
     * 
     * @param stSiRecord 服务对应下料记录信息
     * @return 结果
     */
	public int insertStSiRecord(StSiRecord stSiRecord);
	
	/**
     * 修改服务对应下料记录
     * 
     * @param stSiRecord 服务对应下料记录信息
     * @return 结果
     */
	public int updateStSiRecord(StSiRecord stSiRecord);
	
	/**
     * 删除服务对应下料记录
     * 
     * @param rsiId 服务对应下料记录ID
     * @return 结果
     */
	public int deleteStSiRecordById(Long rsiId);
	
	/**
     * 批量删除服务对应下料记录
     * 
     * @param rsiIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteStSiRecordByIds(String[] rsiIds);
	
}