package com.bit.op.osf.member.dao;

import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.member.model.MemRegInfo;

public interface MemberInfoDao {
	public int insertMemberInfo(MemRegInfo memRegInfo, HttpServletRequest request) throws Exception;
	public MemRegInfo selectMember( String id, String pw);
}
