package com.ruoyi.web.controller.room;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.util.ShiroUtils;
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
import com.ruoyi.room.domain.Room;
import com.ruoyi.room.service.IRoomService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 美容房间 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-03-27
 */
@Controller
@RequestMapping("/room/room")
public class RoomController extends BaseController
{
    private String prefix = "room/room";
	
	@Autowired
	private IRoomService roomService;
	
	@RequiresPermissions("room:room:view")
	@GetMapping()
	public String room()
	{
	    return prefix + "/room";
	}
	
	/**
	 * 查询美容房间列表
	 */
	@RequiresPermissions("room:room:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Room room)
	{
		startPage();
		List<Room> list = null;
		SysUser user= ShiroUtils.getSysUser();
		if(user.getUserId()==1){
			list = roomService.selectRoomList(room);
		}else{
			list = roomService.selectByDeptIdRoom(room.getDeptId(),room.getState());
		}

		return getDataTable(list);
	}
	
	
	/**
	 * 导出美容房间列表
	 */
	@RequiresPermissions("room:room:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Room room)
    {
    	List<Room> list = roomService.selectRoomList(room);
        ExcelUtil<Room> util = new ExcelUtil<Room>(Room.class);
        return util.exportExcel(list, "room");
    }
	
	/**
	 * 新增美容房间
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存美容房间
	 */
	@RequiresPermissions("room:room:add")
	@Log(title = "美容房间", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Room room)
	{
//		SysUser user= ShiroUtils.getSysUser();
//		if(user !=null){
//			room.setDeptId(user.getDeptId());
//		}
		room.setCreateTime(DateUtils.getNowDate());
		return toAjax(roomService.insertRoom(room));
	}

	/**
	 * 修改美容房间
	 */
	@GetMapping("/edit/{roId}")
	public String edit(@PathVariable("roId") Long roId, ModelMap mmap)
	{
		Room room = roomService.selectRoomById(roId);
		mmap.put("room", room);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存美容房间
	 */
	@RequiresPermissions("room:room:edit")
	@Log(title = "美容房间", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Room room)
	{
		room.setUpdateTime(DateUtils.getNowDate());
		return toAjax(roomService.updateRoom(room));
	}
	
	/**
	 * 删除美容房间
	 */
	@RequiresPermissions("room:room:remove")
	@Log(title = "美容房间", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(roomService.deleteRoomByIds(ids));
	}
	
}
