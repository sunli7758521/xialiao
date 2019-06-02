package com.ruoyi.item.service.impl;

import java.util.List;

import com.ruoyi.room.domain.Room;
import com.ruoyi.system.domain.SysDept;
import com.ruoyi.system.mapper.SysDeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.item.mapper.ServiceItemsMapper;
import com.ruoyi.item.domain.ServiceItems;
import com.ruoyi.item.service.IServiceItemsService;
import com.ruoyi.common.core.text.Convert;

/**
 * 服务项 服务层实现
 * 
 * @author ruoyi
 * @date 2019-03-26
 */
@Service
public class ServiceItemsServiceImpl implements IServiceItemsService 
{
	@Autowired
	private ServiceItemsMapper serviceItemsMapper;

	@Autowired
	private SysDeptMapper sysDeptMapper;
	/**
     * 查询服务项信息
     * 
     * @param siId 服务项ID
     * @return 服务项信息
     */
    @Override
	public ServiceItems selectServiceItemsById(Long siId)
	{
	    return serviceItemsMapper.selectServiceItemsById(siId);
	}
	
	/**
     * 查询服务项列表
     * 
     * @param serviceItems 服务项信息
     * @return 服务项集合
     */
	@Override
	public List<ServiceItems> selectServiceItemsList(ServiceItems serviceItems)
	{
		List<ServiceItems> st =  serviceItemsMapper.selectServiceItemsList(serviceItems);
		if(st.size() > 0){
			for (ServiceItems items : st) {
			SysDept dept = sysDeptMapper.selectDeptById(Long.parseLong(items.getDeptId()));
				if(dept !=null){
					items.setDeptName(dept.getDeptName());
				}
			}
		}
		return st;
	}
	
    /**
     * 新增服务项
     * 
     * @param serviceItems 服务项信息
     * @return 结果
     */
	@Override
	public int insertServiceItems(ServiceItems serviceItems)
	{
	    return serviceItemsMapper.insertServiceItems(serviceItems);
	}
	
	/**
     * 修改服务项
     * 
     * @param serviceItems 服务项信息
     * @return 结果
     */
	@Override
	public int updateServiceItems(ServiceItems serviceItems)
	{
	    return serviceItemsMapper.updateServiceItems(serviceItems);
	}

	/**
     * 删除服务项对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteServiceItemsByIds(String ids)
	{
		return serviceItemsMapper.deleteServiceItemsByIds(Convert.toStrArray(ids));
	}

	/**
	 * 根据部门查询自己部门的服务
	 *
	 **/
	@Override
	public List<ServiceItems> selectByDeptIdService(Long deptId, String status) {

		List<ServiceItems> st = serviceItemsMapper.selectByDeptIdService(deptId,status);
		if(st.size() > 0){
			for (ServiceItems items : st) {
				SysDept dept = sysDeptMapper.selectDeptById(Long.parseLong(items.getDeptId()));
				if(dept !=null){
					items.setDeptName(dept.getDeptName());
				}
			}
		}
		return st;



	}

	/**
	 * 根据部门查询自己部门的服务
	 **/
	@Override
	public List<ServiceItems> selectDeptRoomList(Long deptId) {
		return serviceItemsMapper.selectDeptRoomList(deptId);
	}

}
