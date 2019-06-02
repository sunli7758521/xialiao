package com.ruoyi.record.mapper;

import com.ruoyi.record.domain.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 美容记录 数据层
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
public interface RecordMapper 
{
	/**
     * 查询美容记录信息
     * 
     * @param srId 美容记录ID
     * @return 美容记录信息
     */
	public Record selectRecordById(Long srId);
	
	/**
     * 查询美容记录列表
     * 
     * @param record 美容记录信息
     * @return 美容记录集合
     */
	public List<Record> selectRecordList(Record record);
	
	/**
     * 新增美容记录
     * 
     * @param record 美容记录信息
     * @return 结果
     */
	public int insertRecord(Record record);
	
	/**
     * 修改美容记录
     * 
     * @param record 美容记录信息
     * @return 结果
     */
	public int updateRecord(Record record);
	
	/**
     * 删除美容记录
     * 
     * @param srId 美容记录ID
     * @return 结果
     */
	public int deleteRecordById(Long srId);
	
	/**
     * 批量删除美容记录
     * 
     * @param srIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteRecordByIds(String[] srIds);

	/** 按部门查询 消费记录*/
	List<Record> selectDeptRecord(@Param("deptId") Long deptId,@Param("gwId") Long gwId,
								  @Param("mrsId") Long mrsId,@Param("siId") Long siId,
								  @Param("roomId") Long roomId);

	/** 美容师和 顾问 查询 所用*/
    List<Record> selectWLAndMrsAllList(@Param("deptId") Long deptId, @Param("state") Integer state);

	/** 物料师 和 美容师  查询数量  并提示信息 */
    Integer selectAllNum(@Param("state") Integer state, @Param("deptId") Long deptId);
}