package com.ruoyi.web.controller.record;

import java.util.List;
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
import com.ruoyi.record.domain.StSiRecord;
import com.ruoyi.record.service.IStSiRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 服务对应下料记录 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-04-01
 */
@Controller
@RequestMapping("/record/stSiRecord")
public class StSiRecordController extends BaseController
{
    private String prefix = "record/stSiRecord";
	
	@Autowired
	private IStSiRecordService stSiRecordService;
	
	@RequiresPermissions("record:stSiRecord:view")
	@GetMapping()
	public String stSiRecord()
	{
	    return prefix + "/stSiRecord";
	}
	
	/**
	 * 查询服务对应下料记录列表
	 */
	@RequiresPermissions("record:stSiRecord:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(StSiRecord stSiRecord)
	{
		startPage();

        List<StSiRecord> list = stSiRecordService.selectStSiRecordList(stSiRecord);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出服务对应下料记录列表
	 */
	@RequiresPermissions("record:stSiRecord:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(StSiRecord stSiRecord)
    {
    	List<StSiRecord> list = stSiRecordService.selectStSiRecordList(stSiRecord);
        ExcelUtil<StSiRecord> util = new ExcelUtil<StSiRecord>(StSiRecord.class);
        return util.exportExcel(list, "stSiRecord");
    }
	
	/**
	 * 新增服务对应下料记录
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存服务对应下料记录
	 */
	@RequiresPermissions("record:stSiRecord:add")
	@Log(title = "服务对应下料记录", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(StSiRecord stSiRecord)
	{		
		return toAjax(stSiRecordService.insertStSiRecord(stSiRecord));
	}

	/**
	 * 修改服务对应下料记录
	 */
	@GetMapping("/edit/{rsiId}")
	public String edit(@PathVariable("rsiId") Long rsiId, ModelMap mmap)
	{
		StSiRecord stSiRecord = stSiRecordService.selectStSiRecordById(rsiId);
		mmap.put("stSiRecord", stSiRecord);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存服务对应下料记录
	 */
	@RequiresPermissions("record:stSiRecord:edit")
	@Log(title = "服务对应下料记录", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(StSiRecord stSiRecord)
	{		
		return toAjax(stSiRecordService.updateStSiRecord(stSiRecord));
	}
	
	/**
	 * 删除服务对应下料记录
	 */
	@RequiresPermissions("record:stSiRecord:remove")
	@Log(title = "服务对应下料记录", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(stSiRecordService.deleteStSiRecordByIds(ids));
	}
	
}
