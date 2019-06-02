package com.ruoyi.web.controller.record;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.JsonResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.item.domain.ServiceIngredients;
import com.ruoyi.item.domain.ServiceItems;
import com.ruoyi.item.service.IServiceIngredientsService;
import com.ruoyi.item.service.IServiceItemsService;
import com.ruoyi.record.domain.Record;
import com.ruoyi.record.domain.StSiRecord;
import com.ruoyi.record.service.IRecordService;
import com.ruoyi.record.service.IStSiRecordService;
import com.ruoyi.room.domain.Room;
import com.ruoyi.room.service.IRoomService;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 美容记录 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-03-28
 */
@Controller
@RequestMapping("/record/record")
public class RecordController extends BaseController
{
	private String prefix = "record/record";
	
	@Autowired
	private IRecordService recordService;

	@Autowired
	private ISysUserService sysUserService;

	@Autowired
	private IRoomService roomService;

	@Autowired
	private IServiceItemsService iServiceItemsService;

	@Autowired
	private IServiceIngredientsService iServiceIngredientsService;

	@Autowired
	private IStSiRecordService stSiRecordService;


	@RequiresPermissions("record:record:view")
	@GetMapping()
	public String record()
	{
	    return prefix + "/record";
	}
	
	/**
	 * 查询美容记录列表
	 */
	@RequiresPermissions("record:record:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Record record)
	{
		startPage();
		List<Record> list = null;
		SysUser user= ShiroUtils.getSysUser();
		if(user.getUserId()==1){
			list = recordService.selectRecordList(record);
		}else{
			list = recordService.selectDeptRecord(user.getDeptId(),
					record.getGwId(),record.getMrsId(),record.getSiId(),record.getRoomId());
		}
		return getDataTable(list);
	}
	
	
	/**
	 * 导出美容记录列表
	 */
	@RequiresPermissions("record:record:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Record record)
    {
    	List<Record> list = recordService.selectRecordList(record);
        ExcelUtil<Record> util = new ExcelUtil<Record>(Record.class);
        return util.exportExcel(list, "record");
    }

    /** 顾问登录*/
	@GetMapping("/login")
	public String login()
	{
		return prefix + "/login";
	}

	/** 校验手机号和用户名称*/
	@PostMapping("/checkUsernameAndphonenumber")
	@ResponseBody
	public Map<String,String> checkUsernameAndphonenumber(String username, String phonenumber)
	{
		Map<String,String> map = sysUserService.checkUsernameAndphonenumber(username,phonenumber);
		return map;
	}

	/** 顾问登录*/
	@GetMapping("/toLogin")
	public String toLogin(String username, String phonenumber,
						  HttpServletRequest request,ModelMap modelMap)
	{
		SysUser user = sysUserService.selectUserNameAndPhone(username,phonenumber);
		System.out.println(user);
		if(user !=null){
			request.getSession().setAttribute("user",user);

	    Long roleId = recordService.selectUserRoleId(user.getUserId());
			System.out.println(roleId);
		/* 1 管理员  2 顾问 100美容师  101 配料师 */
		List<Room>	roomList = null;
		List<ServiceItems> siList = null;
		List<SysUser> gwList = null;
		List<SysUser> mrsList = null;
		Integer state = null;
		//		顾问查询记录
		List<Record> recordGWList = null;
		if(roleId == 2){
			roomList = roomService.selectgetDeptRoomList(user.getDeptId());
			siList = iServiceItemsService.selectDeptRoomList(user.getDeptId());
			gwList = recordService.selectAllRoleNameAndId(roleId,user.getDeptId());
		    mrsList =	recordService.selectAllRoleNameAndId(100L,user.getDeptId());
			if(roomList !=null  || siList !=null || mrsList !=null){
				modelMap.addAttribute("mrsList",mrsList);
				modelMap.addAttribute("gwList",gwList);
				modelMap.addAttribute("roomList",roomList);
				modelMap.addAttribute("siList",siList);
			}else {
				modelMap.addAttribute("mrsList",null);
				modelMap.addAttribute("gwList",null);
				modelMap.addAttribute("roomList",null);
				modelMap.addAttribute("siList",null);
			}


			return prefix + "/add";
		}else if(roleId == 100){
			return prefix + "/mrsRecordList";
		}else if(roleId == 101 ){
			return prefix + "/wlRecordList";
		}
	}else{
			return "用户名或密码错误";
	}
		return prefix + "/login";
	}
	/**
	 * 物料 查询 自己部门的物料记录
	 */
	@PostMapping("/wLlist")
	@ResponseBody
	public TableDataInfo wLlist(Record record,HttpServletRequest request)
	{
		startPage();

		List<Record> list = null;
		SysUser user =(SysUser)	request.getSession().getAttribute("user");
		Long roleId = recordService.selectUserRoleId(user.getUserId());
		/* 1 管理员  2 顾问 100美容师  101 配料师 */
		Integer state = null;
		if(roleId==101){
			 state = 1;
			 list = recordService.selectWLAndMrsAllList(user.getDeptId(),state);
		}else if(roleId == 100){
			state = 2;
			list = recordService.selectWLAndMrsAllList(user.getDeptId(),state);
		}
		return getDataTable(list);
	}
		/**
		 *  查询改物料师 共有多少条记录
		 **/
		@PostMapping("/selectCountNum")
		@ResponseBody
		public JsonResult selectCountNum(Long id,HttpServletRequest request)
		{
			SysUser user =(SysUser)	request.getSession().getAttribute("user");
			Long roleId = recordService.selectUserRoleId(user.getUserId());
			/* 1 管理员  2 顾问 100美容师  101 配料师 */
			Integer num = null;
			Integer state = null;
			if(roleId==101){
				state = 1;
				num = recordService.selectAllNum(state,user.getDeptId());
			}else if(roleId == 100){
				state = 2;
				num = recordService.selectAllNum(state, user.getDeptId());
			}
			return JsonResult.success(num,"更新成功");
		}


	/* 查询服务项所需的配料 */
	@PostMapping("/selectHao")
	@ResponseBody
	public JsonResult selectHao(Long id)
	{
	    List<ServiceIngredients> list =	iServiceIngredientsService.selectServiceIngredients(id);
	    return JsonResult.success(list,"更新成功");
	}

	/* 修改 单据的状态 */
	@PostMapping("/updateStatus")
	@ResponseBody
	public JsonResult updateStatus(Long id,Integer state)
	{
		Record record = null;
		// 物料确认
		if(state==1 ){
			record = recordService.selectRecordById(id);
			record.setState("2");
			recordService.updateRecord(record);
		}else if(state==2){
			record = recordService.selectRecordById(id);
			record.setState("3");
			record.setEndTime(DateUtils.getNowDate());
			recordService.updateRecord(record);
			//  美容师 确认 修改房间状态
		 Room room = roomService.selectRoomById(record.getRoomId());
		 if(room !=null){
		 	room.setState("0");
		 }
			roomService.updateRoom(room);
		}
		return JsonResult.success("更新成功");
	}



	/**
	 * 新增保存美容记录
	 */
	@Log(title = "美容记录", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Record record,HttpServletRequest request)
	{
	   SysUser user =(SysUser)	request.getSession().getAttribute("user");
		Integer row = 0;
	   try {

			if(user !=null){
				record.setDeptId(user.getDeptId()+"");
				if(record.getSiId() !=null){
					List<ServiceIngredients> islist = iServiceIngredientsService.selectServiceIngredientsBySiId(record.getSiId());
					if(islist.size() > 0){
						for (ServiceIngredients serviceIngredients : islist) {
							// 添加服务项id 和配料id 方便统计
							StSiRecord siRecord = new StSiRecord();
							siRecord.setStId(serviceIngredients.getStId());
							siRecord.setSiId(serviceIngredients.getSmId());
							siRecord.setCreateTime(DateUtils.getNowDate());
							stSiRecordService.insertStSiRecord(siRecord);
						}
					}
				}

				/**  通过服务项目id查询所用的配料 sid2 */
				if(record.getSiId2() !=null){
					List<ServiceIngredients> sid2list = iServiceIngredientsService.selectServiceIngredientsBySiId(record.getSiId2());
					if(sid2list.size() > 0){
						for (ServiceIngredients serviceIngredients : sid2list) {
							// 添加服务项id 和配料id 方便统计
							StSiRecord siRecord = new StSiRecord();
							siRecord.setStId(serviceIngredients.getStId());
							siRecord.setSiId(serviceIngredients.getSmId());
							siRecord.setCreateTime(DateUtils.getNowDate());
							stSiRecordService.insertStSiRecord(siRecord);
						}
					}
				}

				/**  通过服务项目id查询所用的配料 sid2 */
				if(record.getSiId3() !=null){
					List<ServiceIngredients> sid3list = iServiceIngredientsService.selectServiceIngredientsBySiId(record.getSiId3());
					if(sid3list.size() > 0){
						for (ServiceIngredients serviceIngredients : sid3list) {
							// 添加服务项id 和配料id 方便统计
							StSiRecord siRecord = new StSiRecord();
							siRecord.setStId(serviceIngredients.getStId());
							siRecord.setSiId(serviceIngredients.getSmId());
							siRecord.setCreateTime(DateUtils.getNowDate());
							stSiRecordService.insertStSiRecord(siRecord);
						}
					}
				}


				Integer state = 1;
				/* 更新房间的使用状态 */
				roomService.updateRoomState(state,record.getRoomId());
				record.setState("1");

				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
				Calendar c = Calendar.getInstance();
				Long endMill = 0L;
				record.setCreateTime(DateUtils.getNowDate());
				if(record.getRoomTime().equals("0")){
					endMill = DateUtils.getNowDate().getTime() + 1800000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);

				}else if(record.getRoomTime().equals("1")){
					endMill = DateUtils.getNowDate().getTime() + 3600000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}else if(record.getRoomTime().equals("2")){
					endMill = DateUtils.getNowDate().getTime() + 5400000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}else if(record.getRoomTime().equals("3")){
					endMill = DateUtils.getNowDate().getTime() + 7200000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}else if(record.getRoomTime().equals("4")){
					endMill = DateUtils.getNowDate().getTime() + 9000000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}else if(record.getRoomTime().equals("5")){
					endMill = DateUtils.getNowDate().getTime() + 10800000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}else if(record.getRoomTime().equals("6")){
					endMill = DateUtils.getNowDate().getTime() + 12600000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}else if(record.getRoomTime().equals("7")){
					endMill = DateUtils.getNowDate().getTime() + 14400000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}else if(record.getRoomTime().equals("8")){
					endMill = DateUtils.getNowDate().getTime() + 16200000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}else if(record.getRoomTime().equals("9")){
					endMill = DateUtils.getNowDate().getTime() + 18000000L;
					c.setTimeInMillis(endMill);
					Date date = c.getTime();
					System.out.println(simpleDateFormat.format(date));
					record.setYjTime(date);
				}
				row = recordService.insertRecord(record);
			}
		}catch (Exception e){
		   System.out.println(e.getMessage());
		   return toAjax(0);
		}


	    return toAjax(row);
	}

	/**
	 * 修改美容记录
	 */
	@GetMapping("/edit/{srId}")
	public String edit(@PathVariable("srId") Long srId, ModelMap mmap)
	{
		Record record = recordService.selectRecordById(srId);
		mmap.put("record", record);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存美容记录
	 */
	@RequiresPermissions("record:record:edit")
	@Log(title = "美容记录", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Record record)
	{		
		return toAjax(recordService.updateRecord(record));
	}
	
	/**
	 * 删除美容记录
	 */
	@RequiresPermissions("record:record:remove")
	@Log(title = "美容记录", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(recordService.deleteRecordByIds(ids));
	}

	/** 退出登录*/

	@GetMapping("/logout")
	@ResponseBody
	public JsonResult logout(HttpServletRequest request)
	{
		HttpSession session1 =request.getSession();
		session1.invalidate();
		return JsonResult.success();
	}

}
