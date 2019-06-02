package com.ruoyi.framework.web.service;

import java.util.List;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.item.domain.ServiceItems;
import com.ruoyi.item.service.IServiceItemsService;
import com.ruoyi.room.domain.Room;
import com.ruoyi.room.service.IRoomService;
import com.ruoyi.system.domain.SysDept;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.SysDictData;
import com.ruoyi.system.service.ISysDictDataService;

import javax.servlet.http.HttpServletRequest;

/**
 * RuoYi首创 html调用 thymeleaf 实现字典读取
 * 
 * @author ruoyi
 */
@Service("dict")
public class DictService
{
    @Autowired
    private ISysDictDataService dictDataService;

    @Autowired
    private ISysDeptService sysDeptService;

    @Autowired
    private IServiceItemsService iServiceItemsService;

    @Autowired
    private IRoomService iRoomService;

    @Autowired
    private   HttpServletRequest request;

    /**
     * 根据字典类型查询字典数据信息
     * 
     * @param dictType 字典类型
     * @return 参数键值
     */
    public List<SysDictData> getType(String dictType)
    {
        return dictDataService.selectDictDataByType(dictType);
    }

    /**
     * 根据字典类型和字典键值查询字典数据信息
     * 
     * @param dictType 字典类型
     * @param dictValue 字典键值
     * @return 字典标签
     */
    public String getLabel(String dictType, String dictValue)
    {
        return dictDataService.selectDictLabel(dictType, dictValue);
    }
    /** 查询部门*/
    public List<SysDept> selectDeptName()
    {
        List<SysDept> list = sysDeptService.selectDeptList(new SysDept());
        return list;
    }

    /** 查询部门*/
    public List<ServiceItems> getService()
    {
        List<ServiceItems> list = iServiceItemsService.selectServiceItemsList(new ServiceItems());
        return list;
    }
    /** 查询所用房间*/
    public List<Room> getRoom()
    {
        List<Room>  list = iRoomService.selectRoomList(new Room());
        return list;
    }
//    /** 查询 部门 房间*/
//    public List<Room> getDeptRoom()
//    {
//        SysUser user = (SysUser) request.getSession().getAttribute("user");
//        System.out.println(user);
//        List<Room>  list = iRoomService.selectgetDeptRoomList(user.getDeptId());
//        return list;
//   }
}
