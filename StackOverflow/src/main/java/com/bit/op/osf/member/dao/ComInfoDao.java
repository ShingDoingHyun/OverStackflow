package com.bit.op.osf.member.dao;

import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.member.model.ComRegInfo;

public interface ComInfoDao {
	public int insertComInfo(ComRegInfo comRegInfo, HttpServletRequest request) throws Exception;
	public ComRegInfo selectCom( String id, String pw);
}
