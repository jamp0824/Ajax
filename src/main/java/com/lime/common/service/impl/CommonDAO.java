package com.lime.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.lime.user.vo.UserVO;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Repository("commonDAO")
public class CommonDAO extends EgovAbstractMapper{
	protected Log log = LogFactory.getLog(CommonDAO.class);

	@Autowired
	private EgovAbstractMapper egovabstractMapper;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}

	/*콤보박스 insert*/
	public List<EgovMap> selectCombo(Map<String, Object> inOutMap) throws EgovBizException{
		return selectList("Common.selectCombo", inOutMap);
	}

	public void insert(Map<String, Object> inOutMap) {
		egovabstractMapper.insert("Common.insertBoard",inOutMap);
	}

	public void update(Map<String, Object> inOutMap) {
		egovabstractMapper.update("Common.updateBoard",inOutMap);
	}
	// 아이디 중복 검사
		public int check_id(String id) throws Exception{
			return sqlSessionTemplate.selectOne("Common.check_id", id);
		}

		// 이메일 중복 검사
		public int check_email(String email) throws Exception{
			return sqlSessionTemplate.selectOne("Common.check_email", email);
		}

		// 회원가입
		@Transactional
		public int join_user(UserVO user) throws Exception{
			return sqlSessionTemplate.insert("Common.join_user", user);
		}


		public List<EgovMap> selectOneAccountBySeq(Map<String, Object> inOutMap) {
			return selectList("Common.selectOneAccountBySeq",inOutMap);
		}
<<<<<<< .mine


=======
		//페이징

		@SuppressWarnings({ "rawtypes", "unchecked" })
		public Map<String,Object> selectPagingList(String queryId, Object params){
			printQueryId(queryId);

			Map<String,Object> map = (Map<String,Object>)params;
			PaginationInfo paginationInfo = null;

			if(map.containsKey("currentPageNo") == false || StringUtils.isEmpty(map.get("currentPageNo")) == true){
				map.put("currentPageNo","1");
			}
			paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(Integer.parseInt(map.get("currentPageNo").toString()));

			if(map.containsKey("PAGE_ROW") == false || StringUtils.isEmpty(map.get("PAGE_ROW")) == true){
				paginationInfo.setRecordCountPerPage(15);

		}//if
			else{

		paginationInfo.setRecordCountPerPage(Integer.parseInt(map.get("PAGE_ROW").toString()));
			} //else
			paginationInfo.setPageSize(10);

			int start = paginationInfo.getFirstRecordIndex();
			int end = start + paginationInfo.getRecordCountPerPage();
			map.put("START",start+1);
			map.put("END",end);
			System.out.println(map.toString());
			params = map;

			System.out.println(params.toString());
			Map<String,Object> returnMap = new HashMap<String,Object>();
			List<Map<String,Object>> list = sqlSessionTemplate.selectList("Common.selectList",params);
			System.out.println(list);

			if(list.size() == 0){
				map = new HashMap<String,Object>();
				map.put("totalCount",0);
				list.add(map);

				if(paginationInfo != null){
					paginationInfo.setTotalRecordCount(0);
					returnMap.put("paginationInfo", paginationInfo);

				}//if
		}//if
			else{
				if(paginationInfo != null){

		paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).get("totalCount").toString()));
								returnMap.put("paginationInfo", paginationInfo);
				} //if
		}//else
		returnMap.put("result", list);

		return returnMap;

		}

	@SuppressWarnings("unchecked")
	public Map<String, Object> accountList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectPagingList("Common.selectList", map);
	}



>>>>>>> .r36
}
