/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qywx.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.jfinal.qyweixin.sdk.api.ApiResult;
import com.jfinal.qyweixin.sdk.api.ConDepartmentApi;
import com.jfinal.qyweixin.sdk.api.ConUserApi;
import com.jfinal.qyweixin.sdk.msg.in.event.InAddressOfficeEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InAddressUserEvent;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.shenpi.entity.Approve;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.shenpi.dao.ApproveDao;

/**
 * 审批Service
 * @author szx
 * @version 2018-08-22
 */
@Service
@Transactional(readOnly = true)
public class QywxService {
	@Autowired
	private SystemService systemService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private UserDao userDao;
	@Transactional(readOnly = false)
	public void addOffice(InAddressOfficeEvent addOfficeEvent) {
		List<Area> areas=UserUtils.getAreaList();
		Area a=new Area();
		for(Area area:areas){
			if(area.getName().equals("重庆市")){
				a=area;
				break;
			}
		}
		Office office=new Office(addOfficeEvent);
		office.setArea(a);
		Office parentOffice=officeService.get(office.getParent());
		if(parentOffice!=null) {
			office.setParentIds(parentOffice.getParentIds()+office.getParentId()+",");
		}
		office.setIsNewRecord(true);
		officeService.save(office);
	}
	
	@Transactional(readOnly = false)
	public void updateOffice(InAddressOfficeEvent addOfficeEvent) {
		Office office=new Office(addOfficeEvent);
		Office parentOffice=officeService.get(office.getParent());
		if(parentOffice!=null) {
			office.setParentIds(parentOffice.getParentIds()+office.getParentId()+",");
		}
		officeService.updateFromWeiXin(office);
	}
	@Transactional(readOnly = false)
	public void addUser(InAddressUserEvent userEvent) {
		if(UserUtils.get(userEvent.getUserID())!=null){
			UpdateUser(userEvent);
			return;
		}
		User user=new User();
		user.setId(userEvent.getUserID());
		user.setCompany(new Office("1"));//固定公司
		//user.setOffice(new Office(userEvent.getDepartment()));
		setUserOffice(user, userEvent.getDepartment());
		user.setPassword(SystemService.entryptPassword("123456"));
		user.setUserType("4");//微信用户
		user.setLoginName(userEvent.getUserID());
		user.setName(userEvent.getName());
		user.setPhoto(userEvent.getAvatar());
		if(StringUtils.isNoneBlank(userEvent.getStatus())){
			String status=userEvent.getStatus();
			if(status.equals("1")){
				user.setDelFlag("0");
			}else if(status.equals("4")){
				user.setDelFlag("1");
			}else if(status.equals("2")){
				user.setDelFlag("1");
			}else{
				user.setDelFlag("1");
			}
		}else{
			user.setDelFlag("1");
		}
		user.setGender(userEvent.getGender());
		user.setMobile(userEvent.getMobile());
		user.setEmail(userEvent.getEmail());
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())){
			UserUtils.clearCache();
		}
		user.setIsNewRecord(true);
		user.preInsert();
		
		List<Role> roleList = Lists.newArrayList();
		List<String> roleIdList = user.getRoleIdList();
		//固定普通用户权限
		for (Role r : UserUtils.getAllRoleList()){
			if (r.getId().equals("6")){
				roleList.add(r);
			}
		}
		user.setRoleList(roleList);
		systemService.saveUserById(user);
		// 清除用户缓存
	}
	@Transactional(readOnly = false)
	public void UpdateUser(InAddressUserEvent userEvent) {
		User user=new User();
		user=UserUtils.get(userEvent.getUserID());
	//	user.setId(userEvent.getUserID());
	//	user.setCompany(new Office("1"));//固定公司
//		user.setOffice(new Office(userEvent.getDepartment()));
//		user.setPassword(SystemService.entryptPassword(userEvent.getUserID()));
//		user.setUserType("4");//微信用户
//		user.setLoginName(userEvent.getUserID());
//		user.setName(userEvent.getName());
		if(StringUtils.isNoneBlank(userEvent.getName()))
			user.setName(userEvent.getName());
		if(StringUtils.isNoneBlank(userEvent.getAvatar()))
			user.setPhoto(userEvent.getAvatar());
		if(StringUtils.isNoneBlank(userEvent.getStatus())){
			String status=userEvent.getStatus();
			if(status.equals("1")){
				user.setDelFlag("0");
			}else if(status.equals("4")){
				user.setDelFlag("1");
			}else if(status.equals("2")){
				user.setDelFlag("1");
			}else{
				user.setDelFlag("1");
			}
		}
		if(StringUtils.isNoneBlank(userEvent.getGender()))
			user.setGender(userEvent.getGender());
		if(StringUtils.isNoneBlank(userEvent.getMobile()))
			user.setMobile(userEvent.getMobile());
		if(StringUtils.isNoneBlank(userEvent.getTelephone()))
			user.setPhone(userEvent.getTelephone());
		if(StringUtils.isNoneBlank(userEvent.getEmail()))
			user.setEmail(userEvent.getEmail());
		setUserOffice(user, userEvent.getDepartment());
		user.preUpdate();
		systemService.updateUserInfo(user);
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())){
			UserUtils.clearCache();
		}
	}
	
	/**
	 * 设置用户部门
	 * @param user
	 * @param departmentId
	 */
	private void setUserOffice(User user,String departmentId){
		if(StringUtils.isNoneBlank(departmentId)){
			String id = departmentId;
			if (id.contains(",")) {
				id = id.split(",")[0];
			}
			user.setOffice(new Office(id));
		}
	}
	
	@Transactional(readOnly = false)
	public void deleteUser(InAddressUserEvent userEvent) {
		User user=new User();
		user.setId(userEvent.getUserID());
		systemService.deleteUser(user);
	}
	
	//@Transactional(readOnly = false)
	/*public void syncAll() {
		//1.所有微信通讯录部门
		ApiResult apiResult = ConDepartmentApi.getDepartment(null);
		System.out.println(apiResult);
		
		//2.所有微信通讯录员工
		ApiResult departmentUserList = ConUserApi.getDepartmentUserList("1", "1", "0");	
		System.out.println(departmentUserList);
		
		//3.系统内所有部门
		List<Office> localOffices = officeService.findAll();
		//4.系统内所有员工
		
		
		//
		List<InAddressOfficeEvent> departments = apiResult.getList("department");
		System.out.println(departments);
		departments.get(0).getId();
		
		//5.1 需要添加的部门
		List<Office> needAddOffice = new ArrayList<Office>();
		
	}
	
	private static List<String> getOfficeIds(List<Office> offices){
		List<String> strings = new ArrayList<String>();
		return strings;
		
		
	}*/
}