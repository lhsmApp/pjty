package com.fh.service.socialOrganize.pesoinfo.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.socialOrganize.pesoinfo.PesoInfoManager;

/** 
 * 说明： 社会组织
 * 创建人：FH Q313596790
 * 创建时间：2017-05-08
 * @version
 */
@Service("pesoinfoService")
public class PesoInfoService implements PesoInfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PesoInfoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PesoInfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PesoInfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PesoInfoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PesoInfoMapper.listAll", pd);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listDic(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PesoInfoMapper.listDic", pd);
	}
	
	/**列表(全部)根据条件搜索
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> queryListByCondition(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PesoInfoMapper.queryListByCondition", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PesoInfoMapper.findById", pd);
	}
	public List<PageData> hasDuplicateRecord(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PesoInfoMapper.hasDuplicateRecord", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PesoInfoMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

