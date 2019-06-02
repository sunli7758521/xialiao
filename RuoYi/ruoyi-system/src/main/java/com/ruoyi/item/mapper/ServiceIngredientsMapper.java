package com.ruoyi.item.mapper;

import com.ruoyi.item.domain.ServiceIngredients;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 服务项配料 数据层
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
public interface ServiceIngredientsMapper 
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
     * 删除服务项配料
     * 
     * @param smId 服务项配料ID
     * @return 结果
     */
	public int deleteServiceIngredientsById(Long smId);
	
	/**
     * 批量删除服务项配料
     * 
     * @param smIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteServiceIngredientsByIds(String[] smIds);

	/** 根据部门查询 配料信息 */
    List<ServiceIngredients> selectDeptServiceIngredientsList(@Param("deptId") Long deptId,
															  @Param("smName") String smName,
															  @Param("smUnit") String smUnit,
															  @Param("stId") Long stId);

	/* 查询服务项所需的配料 */
    List<ServiceIngredients> selectServiceIngredients( @Param("id") Long id);

	/**  通过服务项目id查询所用的配料 */
    List<ServiceIngredients> selectServiceIngredientsBySiId(@Param("siId") Long siId);
}