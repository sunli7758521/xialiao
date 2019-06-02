package com.ruoyi.room.service.impl;

import java.util.List;

import com.ruoyi.system.domain.SysDept;
import com.ruoyi.system.mapper.SysDeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.room.mapper.RoomMapper;
import com.ruoyi.room.domain.Room;
import com.ruoyi.room.service.IRoomService;
import com.ruoyi.common.core.text.Convert;

/**
 * 美容房间 服务层实现
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
@Service
public class RoomServiceImpl implements IRoomService 
{
	@Autowired
	private RoomMapper roomMapper;

	@Autowired
	private SysDeptMapper sysDeptMapper;
	/**
     * 查询美容房间信息
     * 
     * @param roId 美容房间ID
     * @return 美容房间信息
     */
    @Override
	public Room selectRoomById(Long roId)
	{
	    return roomMapper.selectRoomById(roId);
	}
	
	/**
     * 查询美容房间列表
     * 
     * @param room 美容房间信息
     * @return 美容房间集合
     */
	@Override
	public List<Room> selectRoomList(Room room)
	{
		List<Room> rm =	roomMapper.selectRoomList(room);
		if(rm.size() >0){
			for (Room r : rm) {
			SysDept dept= sysDeptMapper.selectDeptById(r.getDeptId());
				if(dept !=null){
					r.setDeptName(dept.getDeptName());
				}
			}
		}
	    return rm;
	}
	
    /**
     * 新增美容房间
     * 
     * @param room 美容房间信息
     * @return 结果
     */
	@Override
	public int insertRoom(Room room)
	{
	    return roomMapper.insertRoom(room);
	}
	
	/**
     * 修改美容房间
     * 
     * @param room 美容房间信息
     * @return 结果
     */
	@Override
	public int updateRoom(Room room)
	{
	    return roomMapper.updateRoom(room);
	}

	/**
     * 删除美容房间对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteRoomByIds(String ids)
	{
		return roomMapper.deleteRoomByIds(Convert.toStrArray(ids));
	}

	/** 根据部门id 查询 自己部门的 房间 */
	@Override
	public List<Room> selectByDeptIdRoom(Long deptId, String state) {
		List<Room> rm =	roomMapper.selectByDeptIdRoom(deptId,state);
		if(rm.size() >0){
			for (Room r : rm) {
				SysDept dept= sysDeptMapper.selectDeptById(r.getDeptId());
				if(dept !=null){
					r.setDeptName(dept.getDeptName());
				}
			}
		}
		return rm;
	}


	/** 查询 部门 房间*/
	@Override
	public List<Room> selectgetDeptRoomList(Long deptId) {
		return roomMapper.selectgetDeptRoomList(deptId);
	}

	/* 更新房间的使用状态 */
	@Override
	public void updateRoomState(Integer state, Long roomId) {
	   Room room =	roomMapper.selectRoomById(roomId);
	     room.setState("1");
		roomMapper.updateRoom(room);
	}
}
