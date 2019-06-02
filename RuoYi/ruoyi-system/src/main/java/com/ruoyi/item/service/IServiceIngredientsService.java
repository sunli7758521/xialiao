package com.ruoyi.item.service;

import com.ruoyi.item.domain.ServiceIngredients;
import java.util.List;
import java.util.Map;

/**
 * 服务项配料 服务层
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
public interface IServiceIngredientsService 
{
	/**
     * 查询服务项配料信息
     * 
     * @param smId 服务项配料ID
     * @return 服务项配料信息
     */
	public ServiceIngredients selectServiceIngredientsById(Long smId);
	
	/**
     * 查询服务项配料列表
     * 
     * @param serviceIngredients 服务项配料信息
     * @return 服务项配料集合
     */
	public List<ServiceIngredients> selectServiceIngredientsList(ServiceIngredients serviceIngredients);
	
	/**
     * 新增服务项配料
     * 
     * @param serviceIngredients 服务项配料信息
     * @return 结果
     */
	public int insertServiceIngredients(ServiceIngredients serviceIngredients);
	
	/**
     * 修改服务项配料
     * 
     * @param serviceIngredients 服务项配料信息
     * @return 结果
     */
	public int updateServiceIngredients(ServiceIngredients serviceIngredients);
		
	/**
     * 删除服务项配料信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteServiceIngredientsByIds(String ids);

	/** 根据部门查询 配料信息 */
	List<ServiceIngredients> selectDeptServiceIngredientsList(Long deptId, String smName, String smUnit, Long stId);

	/* 查询服务项所需的配料 */
    List<ServiceIngredients> selectServiceIngredients(Long id);

	/**  通过服务项目id查询所用的配料 */
	List<ServiceIngredients> selectServiceIngredientsBySiId(Long siId);
}
