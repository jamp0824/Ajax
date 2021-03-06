package com.lime.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.lime.user.vo.UserVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CommonService {

	List<EgovMap> selectCombo(Map<String, Object> inOutMap) throws Exception;

	void insertBoard(Map<String, Object> inOutMap);

	void updateBoard(Map<String, Object> inOutMap);

	public void check_id(String userId, HttpServletResponse response) throws Exception;

	public void check_pwd(String pwd, HttpServletResponse response) throws Exception;

	public int join_user(UserVO user, HttpServletResponse response) throws Exception;

	Map<String, Object> accountList(Map<String, Object> inOutMap) throws Exception;

	List<EgovMap> selectOneAccountBySeq(Map<String, Object> inOutMap);

}


