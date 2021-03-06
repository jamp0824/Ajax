package com.lime.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.lime.common.service.CommonService;
import com.lime.user.vo.UserVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("commonService")
public class CommonServiceImpl implements CommonService {


	@Resource(name="commonDAO")
	private CommonDAO commonDAO;

	@Override
	public List<EgovMap> selectCombo(Map<String, Object> inOutMap) throws Exception {
		return commonDAO.selectCombo(inOutMap);
	}

	@Override
	public void insertBoard(Map<String, Object> inOutMap) {
		commonDAO.insert(inOutMap);
	}

	@Override
	public void updateBoard(Map<String, Object> inOutMap) {
		commonDAO.update(inOutMap);
	}

	@Override
	public void check_id(String userId, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void check_pwd(String pwd, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int join_user(UserVO user, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> accountList(Map<String, Object> inOutMap) throws Exception {
		return commonDAO.accountList(inOutMap);
	}

	@Override
	public List<EgovMap> selectOneAccountBySeq(Map<String, Object> inOutMap) {
		return commonDAO.selectOneAccountBySeq(inOutMap);
	}






}
