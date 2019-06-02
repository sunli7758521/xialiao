package com.ruoyi.room.service;

import com.ruoyi.room.domain.Room;
import java.util.List;

/**
 * 美容房间 服务层
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
public interface IRoomService 
{
	/**
     * 查询美容房间信息
     * 
     * @param roId 美容房间ID
     * @return 美容房间信息
     */
	public Room selectRoomById(Long roId);
	
	/**
     * 查询美容房间列表
     * 
     * @param room 美容房间信息
     * @return 美容房间集合
     */
	public List<Room> selectRoomList(Room room);
	
	/**
     * 新增美容房间
     * 
     * @param room 美容房间信息
     * @return 结果
     */
	public int insertRoom(Room room);
	
	/**
     * 修改美容房间
     * 
     * @param room 美容房间信息
     * @return 结果
     */
	public int updateRoom(Room room);
		
	/**
     * 删除美容房间信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteRoomByIds(String ids);

	/** 根据部门id 查询 自己部门的 房间*/
    List<Room> selectByDeptIdRoom(Long deptId, String state);

	/** 查询 部门 房间*/
    List<Room> selectgetDeptRoomList(Long deptId);

	/* 更新房间的使用状态 */
    void updateRoomState(Integer state, Long roomId);
}
