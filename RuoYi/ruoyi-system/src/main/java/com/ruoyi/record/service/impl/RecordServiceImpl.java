package com.ruoyi.record.service.impl;

import java.util.List;

import com.ruoyi.item.domain.ServiceItems;
import com.ruoyi.item.mapper.ServiceItemsMapper;
import com.ruoyi.room.domain.Room;
import com.ruoyi.room.mapper.RoomMapper;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.mapper.SysRoleMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.mapper.SysUserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.record.mapper.RecordMapper;
import com.ruoyi.record.domain.Record;
import com.ruoyi.record.service.IRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 美容记录 服务层实现
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
@Service
public class RecordServiceImpl implements IRecordService 
{
	@Autowired
	private RecordMapper recordMapper;

	@Autowired
	private SysUserMapper sysUserMapper;

	@Autowired
	private ServiceItemsMapper serviceItemsMapper;

	@Autowired
	private RoomMapper roomMapper;

	@Autowired
	private SysUserRoleMapper sysUserRoleMapper;

	@Autowired
	private SysRoleMapper sysRoleMapper;

	/**
     * 查询美容记录信息
     * 
     * @param srId 美容记录ID
     * @return 美容记录信息
     */
    @Override
	public Record selectRecordById(Long srId)
	{
	    return recordMapper.selectRecordById(srId);
	}
	
	/**
     * 查询美容记录列表
     * 
     * @param record 美容记录信息
     * @return 美容记录集合
     */
	@Override
	public List<Record> selectRecordList(Record record)
	{
		List<Record> records = recordMapper.selectRecordList(record);
		for (Record re : records) {
			SysUser user = sysUserMapper.selectUserById(re.getMrsId());
			if(user !=null){
				re.setMrName(user.getUserName());
			}
			SysUser user1 = sysUserMapper.selectUserById(re.getGwId());
			if(user1 !=null){
				re.setGwName(user1.getUserName());
			}
			ServiceItems si= null;

			if(re.getSiId() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId());
				if(si !=null){
					re.setSiName(si.getSiName());
				}
			}
			if(re.getSiId2() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId2());
				if(si !=null){
					re.setSiName2 (si.getSiName());
				}
			}
			if(re.getSiId3() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId3());
				if(si !=null){
					re.setSiName3(si.getSiName());
				}
			}

		    Room room = roomMapper.selectRoomById(re.getRoomId());
			if(room != null){
				re.setRoomName(room.getRoName());
			}
		}
		return records;
	}
	
    /**
     * 新增美容记录
     * 
     * @param record 美容记录信息
     * @return 结果
     */
	@Override
	public int insertRecord(Record record)
	{
	    return recordMapper.insertRecord(record);
	}
	
	/**
     * 修改美容记录
     * 
     * @param record 美容记录信息
     * @return 结果
     */
	@Override
	public int updateRecord(Record record)
	{
	    return recordMapper.updateRecord(record);
	}

	/**
     * 删除美容记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteRecordByIds(String ids)
	{
		return recordMapper.deleteRecordByIds(Convert.toStrArray(ids));
	}

	/** 按部门查询 消费记录*/
	@Override
	public List<Record> selectDeptRecord( Long deptId, Long gwId, Long mrsId, Long siId,Long roomId) {

		List<Record> records = recordMapper.selectDeptRecord(deptId,gwId,mrsId,siId,roomId);

		for (Record re : records) {
			SysUser user = sysUserMapper.selectUserById(re.getMrsId());
			if(user !=null){
				re.setMrName(user.getUserName());
			}
			SysUser user1 = sysUserMapper.selectUserById(re.getGwId());
			if(user1 !=null){
				re.setGkName(user1.getUserName());
			}
			ServiceItems si= null;

			if(re.getSiId() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId());
				if(si !=null){
					re.setSiName(si.getSiName());
				}
			}
			if(re.getSiId2() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId2());
				if(si !=null){
					re.setSiName2 (si.getSiName());
				}
			}
			if(re.getSiId3() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId3());
				if(si !=null){
					re.setSiName3(si.getSiName());
				}
			}
			Room room = roomMapper.selectRoomById(re.getRoomId());
			if(room != null){
				re.setRoomName(room.getRoName());
			}
		}

		return records;
	}

	/** 查询用户 角色 */
	@Override
	public Long selectUserRoleId(Long userId) {
		return sysUserRoleMapper.selectUserRoleId(userId);
	}

	/** 查询所用的角色*/
	@Override
	public List<SysUser> selectAllRoleNameAndId(Long roleId,Long deptId) {
		return sysUserMapper.selectAllRoleNameAndId(roleId,deptId);
	}


	/** 美容师和 顾问 查询 所用*/
	@Override
	public List<Record> selectWLAndMrsAllList(Long deptId, Integer state) {
		List<Record> records =	recordMapper.selectWLAndMrsAllList(deptId,state);

		for (Record re : records) {
			SysUser user = sysUserMapper.selectUserById(re.getMrsId());
			if(user !=null){
				re.setMrName(user.getUserName());
			}
			SysUser user1 = sysUserMapper.selectUserById(re.getGwId());
			if(user1 !=null){
				re.setGwName(user1.getUserName());
			}

			ServiceItems si= null;
			if(re.getSiId() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId());
				if(si !=null){
					re.setSiName(si.getSiName());
				}
			}
			if(re.getSiId2() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId2());
				if(si !=null){
					re.setSiName2 (si.getSiName());
				}
			}
			if(re.getSiId3() !=null){
				si = serviceItemsMapper.selectServiceItemsById(re.getSiId3());
				if(si !=null){
					re.setSiName3(si.getSiName());
				}
			}
			Room room = roomMapper.selectRoomById(re.getRoomId());
			if(room != null){
				re.setRoomName(room.getRoName());
			}
		}
		return records;
	}

	/** 物料师 和 美容师  查询数量  并提示信息 */
	@Override
	public Integer selectAllNum(Integer state, Long deptId) {
		return recordMapper.selectAllNum(state,deptId);
	}

}
