package com.ruoyi.item.service.impl;

import java.util.List;

import com.ruoyi.item.domain.ServiceItems;
import com.ruoyi.item.mapper.ServiceItemsMapper;
import com.ruoyi.system.domain.SysDept;
import com.ruoyi.system.mapper.SysDeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.item.mapper.ServiceIngredientsMapper;
import com.ruoyi.item.domain.ServiceIngredients;
import com.ruoyi.item.service.IServiceIngredientsService;
import com.ruoyi.common.core.text.Convert;

/**
 * 服务项配料 服务层实现
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
@Service
public class ServiceIngredientsServiceImpl implements IServiceIngredientsService 
{
	@Autowired
	private ServiceIngredientsMapper serviceIngredientsMapper;

	@Autowired
	private ServiceItemsMapper serviceItemsMapper;

	@Autowired
	private SysDeptMapper sysDeptMapper;
	/**
     * 查询服务项配料信息
     * 
     * @param smId 服务项配料ID
     * @return 服务项配料信息
     */
    @Override
	public ServiceIngredients selectServiceIngredientsById(Long smId)
	{
	    return serviceIngredientsMapper.selectServiceIngredientsById(smId);
	}
	
	/**
     * 查询服务项配料列表
     * 
     * @param serviceIngredients 服务项配料信息
     * @return 服务项配料集合
     */
	@Override
	public List<ServiceIngredients> selectServiceIngredientsList(ServiceIngredients serviceIngredients)
	{
		List<ServiceIngredients> si = serviceIngredientsMapper.selectServiceIngredientsList(serviceIngredients);
		if(si.size()>0){
			for (ServiceIngredients ingredients : si) {
				SysDept dept = sysDeptMapper.selectDeptById(ingredients.getDeptId());
					if(dept !=null){
						ingredients.setDeptName(dept.getDeptName());
					}
				ServiceItems  st =	serviceItemsMapper.selectServiceItemsById(ingredients.getStId());
				if(st !=null){
						ingredients.setServiceItemName(st.getSiName());
				}
			}
		}
		return si;
	}
	
    /**
     * 新增服务项配料
     * 
     * @param serviceIngredients 服务项配料信息
     * @return 结果
     */
	@Override
	public int insertServiceIngredients(ServiceIngredients serviceIngredients)
	{
	    return serviceIngredientsMapper.insertServiceIngredients(serviceIngredients);
	}
	
	/**
     * 修改服务项配料
     * 
     * @param serviceIngredients 服务项配料信息
     * @return 结果
     */
	@Override
	public int updateServiceIngredients(ServiceIngredients serviceIngredients)
	{
	    return serviceIngredientsMapper.updateServiceIngredients(serviceIngredients);
	}

	/**
     * 删除服务项配料对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteServiceIngredientsByIds(String ids)
	{
		return serviceIngredientsMapper.deleteServiceIngredientsByIds(Convert.toStrArray(ids));
	}

	/** 根据部门查询 配料信息 */
	@Override
	public List<ServiceIngredients> selectDeptServiceIngredientsList(Long deptId, String smName, String smUnit, Long stId) {
		List<ServiceIngredients> si = serviceIngredientsMapper.selectDeptServiceIngredientsList(deptId,smName,smUnit,stId);

		if(si.size()>0){
			for (ServiceIngredients ingredients : si) {
				SysDept dept = sysDeptMapper.selectDeptById(ingredients.getDeptId());
				if(dept !=null){
					ingredients.setDeptName(dept.getDeptName());
				}
				ServiceItems  st =	serviceItemsMapper.selectServiceItemsById(ingredients.getStId());
				if(st !=null){
					ingredients.setServiceItemName(st.getSiName());
				}
			}
		}
		return si;
	}

	/* 查询服务项所需的配料 */
	@Override
	public List<ServiceIngredients> selectServiceIngredients(Long id) {
		return serviceIngredientsMapper.selectServiceIngredients(id);
	}

	/**  通过服务项目id查询所用的配料 */
	@Override
	public List<ServiceIngredients> selectServiceIngredientsBySiId(Long siId) {

		return serviceIngredientsMapper.selectServiceIngredientsBySiId(siId);
	}
}
