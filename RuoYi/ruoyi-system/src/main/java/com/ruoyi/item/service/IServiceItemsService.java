package com.ruoyi.item.service;

import com.ruoyi.item.domain.ServiceItems;
import com.ruoyi.room.domain.Room;

import java.util.List;

/**
 * 服务项 服务层
 * 
 * @author ruoyi
 * @date 2019-03-26
 */
public interface IServiceItemsService 
{
	/**
     * 查询服务项信息
     * 
     * @param siId 服务项ID
     * @return 服务项信息
     */
	public ServiceItems selectServiceItemsById(Long siId);
	
	/**
     * 查询服务项列表
     * 
     * @param serviceItems 服务项信息
     * @return 服务项集合
     */
	public List<ServiceItems> selectServiceItemsList(ServiceItems serviceItems);
	
	/**
     * 新增服务项
     * 
     * @param serviceItems 服务项信息
     * @return 结果
     */
	public int insertServiceItems(ServiceItems serviceItems);
	
	/**
     * 修改服务项
     * 
     * @param serviceItems 服务项信息
     * @return 结果
     */
	public int updateServiceItems(ServiceItems serviceItems);
		
	/**
     * 删除服务项信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteServiceItemsByIds(String ids);

	/**
	 * 根据部门查询自己部门的服务
	 *
	 **/
    List<ServiceItems> selectByDeptIdService(Long deptId, String status);

    /**
	 * 根据部门查询自己部门的服务
	 **/
    List<ServiceItems> selectDeptRoomList(Long deptId);
}
