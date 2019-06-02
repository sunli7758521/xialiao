package com.ruoyi.record.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.record.mapper.StSiRecordMapper;
import com.ruoyi.record.domain.StSiRecord;
import com.ruoyi.record.service.IStSiRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 服务对应下料记录 服务层实现
 * 
 * @author ruoyi
 * @date 2019-04-01
 */
@Service
public class StSiRecordServiceImpl implements IStSiRecordService 
{
	@Autowired
	private StSiRecordMapper stSiRecordMapper;

	/**
     * 查询服务对应下料记录信息
     * 
     * @param rsiId 服务对应下料记录ID
     * @return 服务对应下料记录信息
     */
    @Override
	public StSiRecord selectStSiRecordById(Long rsiId)
	{
	    return stSiRecordMapper.selectStSiRecordById(rsiId);
	}
	
	/**
     * 查询服务对应下料记录列表
     * 
     * @param stSiRecord 服务对应下料记录信息
     * @return 服务对应下料记录集合
     */
	@Override
	public List<StSiRecord> selectStSiRecordList(StSiRecord stSiRecord)
	{
	    return stSiRecordMapper.selectStSiRecordList(stSiRecord);
	}
	
    /**
     * 新增服务对应下料记录
     * 
     * @param stSiRecord 服务对应下料记录信息
     * @return 结果
     */
	@Override
	public int insertStSiRecord(StSiRecord stSiRecord)
	{
	    return stSiRecordMapper.insertStSiRecord(stSiRecord);
	}
	
	/**
     * 修改服务对应下料记录
     * 
     * @param stSiRecord 服务对应下料记录信息
     * @return 结果
     */
	@Override
	public int updateStSiRecord(StSiRecord stSiRecord)
	{
	    return stSiRecordMapper.updateStSiRecord(stSiRecord);
	}

	/**
     * 删除服务对应下料记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteStSiRecordByIds(String ids)
	{
		return stSiRecordMapper.deleteStSiRecordByIds(Convert.toStrArray(ids));
	}
	
}
