package com.fh.controller.betting;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.Menu;
import com.fh.service.system.menu.MenuManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.StringUtil;

/**
 * 投注站信息查询
* @ClassName: BettingMapController
* @Description: TODO(这里用一句话描述这个类的作用)
* @author jiachao
* @date 2017年5月3日
*
 */
@Controller
@RequestMapping(value="/betting")
public class BettingMapController extends BaseController{
	@Resource(name="menuService")
	private MenuManager menuService;
	
	@RequestMapping(value="/mapQuery")
	public ModelAndView mapQuery()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			String MENU_ID =StringUtil.toString(pd.get("MENU_ID"), "") ;
			List<Menu> menuList = menuService.listSubMenuByParentId(MENU_ID);
			//mv.addObject("pd", menuService.getMenuById(pd));	//传入父菜单所有信息
			mv.addObject("MENU_ID", MENU_ID);
			mv.addObject("menuList", menuList);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
			mv.setViewName("betting/bettingMap");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
}
