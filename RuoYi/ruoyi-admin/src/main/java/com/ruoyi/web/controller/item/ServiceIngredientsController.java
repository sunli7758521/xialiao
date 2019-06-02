package com.ruoyi.web.controller.item;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.item.domain.ServiceItems;
import com.ruoyi.system.domain.SysUser;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.item.domain.ServiceIngredients;
import com.ruoyi.item.service.IServiceIngredientsService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 服务项配料 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
@Controller
@RequestMapping("/item/serviceIngredients")
public class ServiceIngredientsController extends BaseController
{
    private String prefix = "item/serviceIngredients";
	
	@Autowired
	private IServiceIngredientsService serviceIngredientsService;
	
	@RequiresPermissions("item:serviceIngredients:view")
	@GetMapping()
	public String serviceIngredients()
	{
	    return prefix + "/serviceIngredients";
	}
	
	/**
	 * 查询服务项配料列表
	 */
	@RequiresPermissions("item:serviceIngredients:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(ServiceIngredients serviceIngredients)
	{
		startPage();
		SysUser user= ShiroUtils.getSysUser();
		List<ServiceIngredients> list = null;
		if(user.getUserId()==1){
			list = serviceIngredientsService.selectServiceIngredientsList(serviceIngredients);
		}else{
			list = serviceIngredientsService.selectDeptServiceIngredientsList(serviceIngredients.getDeptId(),serviceIngredients.getSmName(),
					serviceIngredients.getSmUnit(),serviceIngredients.getStId());
		}
		return getDataTable(list);
	}
	
	
	/**
	 * 导出服务项配料列表
	 */
	@RequiresPermissions("item:serviceIngredients:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ServiceIngredients serviceIngredients)
    {
    	List<ServiceIngredients> list = serviceIngredientsService.selectServiceIngredientsList(serviceIngredients);
        ExcelUtil<ServiceIngredients> util = new ExcelUtil<ServiceIngredients>(ServiceIngredients.class);
        return util.exportExcel(list, "serviceIngredients");
    }
	
	/**
	 * 新增服务项配料
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存服务项配料
	 */
	@RequiresPermissions("item:serviceIngredients:add")
	@Log(title = "服务项配料", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(ServiceIngredients serviceIngredients)
	{
		SysUser user =	ShiroUtils.getSysUser();
		if(user != null){
			serviceIngredients.setDeptId(user.getDeptId());
		}
		serviceIngredients.setCreateTime(DateUtils.getNowDate());
		return toAjax(serviceIngredientsService.insertServiceIngredients(serviceIngredients));
	}

	/**
	 * 修改服务项配料
	 */
	@GetMapping("/edit/{smId}")
	public String edit(@PathVariable("smId") Long smId, ModelMap mmap)
	{
		ServiceIngredients serviceIngredients = serviceIngredientsService.selectServiceIngredientsById(smId);
		mmap.put("serviceIngredients", serviceIngredients);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存服务项配料
	 */
	@RequiresPermissions("item:serviceIngredients:edit")
	@Log(title = "服务项配料", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(ServiceIngredients serviceIngredients)
	{		
		return toAjax(serviceIngredientsService.updateServiceIngredients(serviceIngredients));
	}
	
	/**
	 * 删除服务项配料
	 */
	@RequiresPermissions("item:serviceIngredients:remove")
	@Log(title = "服务项配料", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(serviceIngredientsService.deleteServiceIngredientsByIds(ids));
	}
	
}
