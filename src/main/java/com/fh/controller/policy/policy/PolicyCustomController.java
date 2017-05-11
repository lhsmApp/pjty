package com.fh.controller.policy.policy;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.policy.policy.PolicyManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

import net.sf.json.JSONArray;

/**
 * 
 * @author JP
 * @version 1.0.0
 * @since 
 * 创建时间：2017年5月9日
 * 功能描述：客户端政策法规展示
 */

@Controller
@RequestMapping(value="/policyCustom")
public class PolicyCustomController extends BaseController{

	@Resource(name="policyService")
	private PolicyManager policyService;
	
	@Resource(name="departmentService")
	private DepartmentManager departmentService;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listCustom")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Policy");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	varList = policyService.list(page);	//列出Policy列表
		mv.setViewName("policy/policyCustom/policyCustom_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 显示列表ztree
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listAllDepartment")
	public ModelAndView listAllDepartment(Model model,String DEPARTMENT_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(departmentService.listAllDepartment("0"));
			String json = arr.toString();
			json = json.replaceAll("DEPARTMENT_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("DEPARTMENT_ID",DEPARTMENT_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("fhoa/department/department_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
}
