package com.ruoyi.record.service;

import com.ruoyi.record.domain.Record;
import com.ruoyi.system.domain.SysUser;

import java.util.List;

/**
 * 美容记录 服务层
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
public interface IRecordService 
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
     * 删除美容记录信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteRecordByIds(String ids);

	/** 按部门查询 消费记录*/
	List<Record> selectDeptRecord( Long deptId, Long gwId, Long mrsId, Long siId,Long roomId);

	/** 查询用户 角色 */
    Long selectUserRoleId(Long userId);

    /** 查询所用的角色*/
	List<SysUser> selectAllRoleNameAndId(Long roleId,Long deptId);

	/** 美容师和 顾问 查询 所用*/
	List<Record> selectWLAndMrsAllList(Long deptId, Integer state);

	/** 物料师 和 美容师  查询数量  并提示信息 */
    Integer selectAllNum(Integer state, Long deptId);
}
