package com.thinkgem.jeesite.modules.mainframe.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.explorer.util.time.timeunit.DayTimeUnit;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.ParseJsonUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActStatistics;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.act.vo.ApplyStatistics;
import com.thinkgem.jeesite.modules.act.vo.DepartmentSumWorkloadStatistics;
import com.thinkgem.jeesite.modules.act.vo.DepartmentWorkloadStatistics;
import com.thinkgem.jeesite.modules.act.vo.WorkloadStatistics;
import com.thinkgem.jeesite.modules.store.entity.Wjgl;
import com.thinkgem.jeesite.modules.store.service.WjglService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.myutils.DateUtil;
import com.thinkgem.jeesite.modules.sys.myutils.ImgUtil;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 公共数据接口
 * 
 * @author she
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/data")
public class DataPublicController {
	private String context=Global.getConfig("context");
	
	private String domain=Global.getConfig("domain2");

	private Logger log = Logger.getLogger(this.getClass());

	public String root_fold = "/data";

	public String img_fold = "/img/";

	public String user_folder = "/file/";

	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private WjglService wjglService;
	@Autowired
	private ActStatistics actStatistics; 
	@Autowired
	private OfficeService officeService;
	
	/**
	 * 返回审批列表size
	 */
	@ResponseBody
	@RequestMapping(value = "getShenpiSize")
	public int getShenpiSize(HttpServletRequest request, HttpServletResponse response, Model model) {
		Act act = new Act();
		List list = actTaskService.todoList(act);
		if(list==null) return 0;
		return list.size();
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	@ResponseBody
	public String imgUpload(@RequestParam(value = "file") MultipartFile file, HttpServletRequest request) {
		if (file.isEmpty()) {
			return null;
		}
		
		String date=new SimpleDateFormat("yyyyMMdd").format(new Date());
		String time=new SimpleDateFormat("HHmmss").format(new Date());
		
		// 获取文件名
		String oldfileName = file.getOriginalFilename();
		String fileName=time+oldfileName;
		// 文件上传后的路径
		String xmm = request.getContextPath().replace("/", "\\");
		String path = request.getSession().getServletContext().getRealPath("");
		int num = path.indexOf("\\.metadata");
		if(num > -1){
			path = path.substring(0, num);
		}
		path += "\\static\\upload\\"+date+"\\";
		ImgUtil.createFile(path, fileName);
		File dest = new File(path + fileName);
		try {
			file.transferTo(dest);
			System.out.println("upload  success");
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("/a/"));
		url += "/static/upload/"+date+"/" + fileName;
		return url;
	}
	@RequestMapping(value = "uploadFiles", method = RequestMethod.POST)
	@ResponseBody
	public Map uploadFiles(@RequestParam(value = "files") MultipartFile[] files, HttpServletRequest request) {
		Map map=new HashMap<String,String>();
		if (files.length==0) {
			return null;
		}
		if(files.length>10) {
			map.put("error", "out Of size");
			map.put("success","0");
			return map;
		}
		for(MultipartFile file:files){
			Wjgl wjgl=new Wjgl();
			String date=new SimpleDateFormat("yyyyMMdd").format(new Date());
			String time=new SimpleDateFormat("HHmmss").format(new Date());
			String r=RandomStringUtils.randomAlphabetic(4);
			// 获取文件名
			String oldfileName = file.getOriginalFilename();
			String suffix = oldfileName.substring(oldfileName.lastIndexOf(".") + 1);
			String fileName=r+time+"."+suffix;
			// 文件上传后的路径
			String xmm = request.getContextPath().replace("/", "\\");
			String path = request.getSession().getServletContext().getRealPath("");
			int num = path.indexOf("\\.metadata");
			if(num > -1){
				path = path.substring(0, num);
			}
			path += "\\static\\upload\\"+date+"\\";
			//path="D:\\qywx\\files\\"+date+"\\";
			ImgUtil.createFile(path, fileName);
			File dest = new File(path + fileName);
			try {
				file.transferTo(dest);
				long uploadTime=new Date().getTime();
				wjgl.setUploadtime(uploadTime);
				System.out.println("upload  success");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("success","0");
				return map;
			}
			String url = request.getRequestURL().toString();
			System.out.println(url);
			//url = url.substring(0, url.indexOf("/a/"));
			url = domain+"/"+context;
			url += "/static/upload/"+date+"/" + fileName;
			//url += "/files/"+date+"/" + fileName;
			map.put("fileName", url);
			wjgl.setName(fileName);
			wjgl.setOldName(oldfileName);
			wjgl.setUser(UserUtils.getUser());
			wjgl.setSize(file.getSize());
			wjgl.setPath(url);		
			wjgl.setType(file.getContentType());
			wjglService.save(wjgl);
			
		}
		return map;
	}
	@RequestMapping(value = "getAssignsForCs", method = RequestMethod.POST)
	public String getAssignsForCs(String copy,Model model) {
		String view="modules/act/histoicMobileFlowList_3";
		copy=StringEscapeUtils.unescapeHtml4(copy);
		Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(copy);
		List<User> result = systemService.getAssignsForCs(map.get("departmentId"), map.get("userId"));
		System.out.println("length="+result.get(0).getName());;
		model.addAttribute("histoicFlowList", result);
		return view;
	}
	
	/**
	 * 查询当前用户的申请数据
	 * @param startTime 
	 * @param endTime 
	 * @return 
	 * @return
	 */
	@RequestMapping(value = "personalApplyStatistics")
	@ResponseBody
	public List<WorkloadStatistics> personalApplyStatistics(Date startTime, Date endTime) {
		String assignee=UserUtils.getUser().getId();
//		assignee="ZhouYuanLin";
		return actStatistics.personalApplyStatistics(assignee, startTime, endTime);
	}
	
	/**
	 * 查询指定用户的申请数据
	 * @param startTime 
	 * @param endTime 
	 * @param id
	 * @return 
	 * @return
	 */
	@RequestMapping(value = "personalApplyStatistics1")
	@ResponseBody
	public List<WorkloadStatistics> personalApplyStatistics(String id,Date startTime, Date endTime) {
		return actStatistics.personalApplyStatistics(id, startTime, endTime);
	}
	
	/**
	 * 查询当前用户工作量
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value = "personalWorkloadStatistics")
	@ResponseBody
	public List<WorkloadStatistics> personalWorkloadStatistics(Date startTime, Date endTime) {
		String assignee=UserUtils.getUser().getId();
//		assignee="ZhouYuanLin";
		return actStatistics.personalWorkloadStatistics(assignee, startTime, endTime,true);
	}
	
	
	
	
	
	/**
	 * 查询指定用户工作量
	 * @param id
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value = "personalWorkloadStatistics1")
	@ResponseBody
	public List<WorkloadStatistics> personalWorkloadStatistics(String id,Date startTime, Date endTime) {
//		assignee="ZhouYuanLin";
		return actStatistics.personalWorkloadStatistics(id, startTime, endTime,true);
	}
	
	/**
	 * 查询部门人员工作量(按状态分组)
	 * @param id
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value = "departmentWorkloadStatistics")
	@ResponseBody
	public List<DepartmentWorkloadStatistics> departmentWorkloadStatistics(String officeId,Date startTime, Date endTime,String state) {
		if(officeId==null||officeId=="") {
			officeId=UserUtils.getUser().getOffice().getId();
		}
		state = (StringUtils.isEmpty(state)?"0":state);
		//List<User> users=systemService.findUserByOfficeId(officeId);
		List<User> users=systemService.getByOfficeId(officeId);
		//查询
		List<String> userids=new ArrayList<String>();
		for (User user : users) {
			userids.add(user.getId());
		}
		return actStatistics.departmentWorkloadStatistics(userids,startTime,endTime,state);
	}
	
	/***
	 *  所有部门工作量统计(按部门分组)
	 * @param startTime
	 * @param endTime
	 * @param state
	 * @return
	 */
	@RequestMapping(value = "departmentSumWorkloadStatistics")
	@ResponseBody
	public List<DepartmentSumWorkloadStatistics> departmentSumWorkloadStatistics(Date startTime, Date endTime,String state) {
		state = (StringUtils.isEmpty(state)?"0":state);
		return actStatistics.departmentSumWorkloadStatistics(startTime,endTime,state);
	}
	
	
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		dateFormat.setLenient(false);  
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	
	
	/**
	 * @author liuwei
	 * 个人接口：获取个人 申请数据统计，未处理统计和处理统计
	 * @param state状态：0表示未处理  1、表示处理   2、表示申请
	 * @param startTime endTime 可为空
	 * @param userId  如果为空  那么默认当前登陆人
	 * 
	 * */
	@RequestMapping(value = "getPersonData")
	@ResponseBody
	public List<WorkloadStatistics> getPersonData(String state,String id,Date startTime, Date endTime){
		if(StringUtils.isEmpty(id)){
			id=UserUtils.getUser().getId();
		}
		state = (StringUtils.isEmpty(state)?"0":state);
		if("0".equals(state)){
		//如果state=0或者为空   则查询未处理数据
			return actStatistics.personalWorkloadStatistics(id, startTime, endTime,false);
		}else if("1".equals(state)){
		//查询已处理数据
			return actStatistics.personalWorkloadStatistics(id, startTime, endTime,true);
		}else if("2".equals(state)){
		//查询申请量
			return actStatistics.personalApplyStatistics(id, startTime, endTime);
		}
		return null;
	}
	
	/**
	 * 根据用户id返回待办详情
	 * act.id 用户id or act.assignee 用户activiti注册名
	 * act.beginDate 开始时间
	 * act.endDate结束时间
	 */
	@RequestMapping(value = "getListActByUser")
	public String getListActByUser(Act act,HttpServletRequest request, HttpServletResponse response, Model model){
		//List<Act> acts=actTaskService.todoListByUserId(act);
		
		if(StringUtils.isEmpty(act.getAssignee())){
			act.setAssignee(UserUtils.getUser().getId());
		}
		
		act.setStatus( (StringUtils.isEmpty(act.getStatus())?"0":act.getStatus())  );
		HashMap<String, Date> timeMap = new HashMap<String,Date>();
		timeMap.put("beginDate", act.getBeginDate());
		timeMap.put("endDate", act.getEndDate());
		DateUtils.setDefaultDate(timeMap);
		act.setBeginDate(timeMap.get("beginDate"));
		act.setEndDate(DateUtils.addOneDay(timeMap.get("endDate")));
		List<Act> acts=null;
		if("0".equals(act.getStatus())){//未处理
			 acts=actTaskService.todoListByUserId(act);
			//return acts;
		}else if("1".equals(act.getStatus())){
		//查询已处理数据
			Page<Act> page = new Page<Act>(request, response);
			acts = actTaskService.historicApply(act);
			//去掉申请的任务节点
			List<Act> actsNotApply= new ArrayList<Act>();
			for (Act act2 : acts) {
				String taskDefKey = act2.getHistTask().getTaskDefinitionKey() ;
				if (!"audit".equals(taskDefKey)) {
					actsNotApply.add(act2);
				}
				System.out.println(taskDefKey);
			}
			acts = actsNotApply;
			//return acts;
		}else if("2".equals(act.getStatus())){//申请
			Page<Act> page = new Page<Act>(request, response);
			act.setTaskDefKey("audit");
			acts = actTaskService.historicApply(act);
			//return acts;
		}
		for(Act a:acts){
			User user=new User();
			if(a.getTask()!=null){
				user=UserUtils.getByLoginName(a.getTask().getAssignee());
			}else{
				user=UserUtils.getByLoginName(a.getHistTask().getAssignee());
			}
			a.setUser(user);
		}
		model.addAttribute("list", acts);
		
		System.out.println("状态"+act.getStatus());
		model.addAttribute("state", act.getStatus());
		return "modules/shenpi/tongjifenxilist";
	}
}
