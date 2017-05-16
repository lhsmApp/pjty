package com.fh.service.socialOrganize.pesoactinfo.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.socialOrganize.pesoactinfo.PesoactInfoManager;

/** 
 * 说明： 体育社会组织活动、资金、评价情况
 * 创建人：FH Q313596790
 * 创建时间：2017-05-09
 * @version
 */
@Service("pesoactinfoService")
public class PesoactInfoService implements PesoactInfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PesoactInfoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PesoactInfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PesoactInfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PesoactInfoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PesoactInfoMapper.listAll", pd);
	}
	
	/**列表
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> pesoNameList()throws Exception{
		return (List<PageData>)dao.findForList("PesoactInfoMapper.pesoNameList", null);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PesoactInfoMapper.findById", pd);
	}
	public PageData hasDuplicateRecord(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PesoactInfoMapper.hasDuplicateRecord", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PesoactInfoMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

