package com.ruoyi.web.controller.item;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysDept;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysDeptService;
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
import com.ruoyi.item.domain.ServiceItems;
import com.ruoyi.item.service.IServiceItemsService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 服务项 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-03-26
 */
@Controller
@RequestMapping("/item/serviceItems")
public class ServiceItemsController extends BaseController
{
    private String prefix = "item/serviceItems";
	
	@Autowired
	private IServiceItemsService serviceItemsService;

	@Autowired
	private ISysDeptService sysDeptService;
	
	@RequiresPermissions("item:serviceItems:view")
	@GetMapping()
	public String serviceItems()
	{
	    return prefix + "/serviceItems";
	}
	
	/**
	 * 查询服务项列表
	 */
	@RequiresPermissions("item:serviceItems:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(ServiceItems serviceItems)
	{
		startPage();
		SysUser user= ShiroUtils.getSysUser();
		List<ServiceItems> list = null;
		if(user.getUserId()==1){
			list = serviceItemsService.selectServiceItemsList(serviceItems);
		}else{
			list = serviceItemsService.selectByDeptIdService(Long.parseLong(serviceItems.getDeptId()),serviceItems.getStatus());
		}
		return getDataTable(list);
	}
	
	
	/**
	 * 导出服务项列表
	 */
	@RequiresPermissions("item:serviceItems:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ServiceItems serviceItems)
    {
    	List<ServiceItems> list = serviceItemsService.selectServiceItemsList(serviceItems);
        ExcelUtil<ServiceItems> util = new ExcelUtil<ServiceItems>(ServiceItems.class);
        return util.exportExcel(list, "serviceItems");
    }
	
	/**
	 * 新增服务项
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存服务项
	 */
	@RequiresPermissions("item:serviceItems:add")
	@Log(title = "服务项", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(ServiceItems serviceItems)
	{
		serviceItems.setUpdateTime(DateUtils.getNowDate());
		return toAjax(serviceItemsService.insertServiceItems(serviceItems));
	}

	/**
	 * 修改服务项
	 */
	@GetMapping("/edit/{siId}")
	public String edit(@PathVariable("siId") Long siId, ModelMap mmap)
	{
		ServiceItems serviceItems = serviceItemsService.selectServiceItemsById(siId);
	    SysDept dept =  sysDeptService.selectDeptById(Long.parseLong(serviceItems.getDeptId()));
	    if(dept !=null){
			mmap.put("dept", dept);
		}
		mmap.put("serviceItems", serviceItems);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存服务项
	 */
	@RequiresPermissions("item:serviceItems:edit")
	@Log(title = "服务项", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(ServiceItems serviceItems)
	{

		serviceItems.setUpdateTime(DateUtils.getNowDate());
		return toAjax(serviceItemsService.updateServiceItems(serviceItems));
	}
	
	/**
	 * 删除服务项
	 */
	@RequiresPermissions("item:serviceItems:remove")
	@Log(title = "服务项", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(serviceItemsService.deleteServiceItemsByIds(ids));
	}
	
}
