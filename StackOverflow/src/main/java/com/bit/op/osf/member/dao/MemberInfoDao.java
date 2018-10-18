package com.bit.op.osf.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.member.model.MemRegInfo;

public interface MemberInfoDao {
	public int insertMemberInfo(MemRegInfo memRegInfo, HttpServletRequest request) throws Exception;
	public MemRegInfo selectMember( String id, String pw);
	public List<MemRegInfo> selectMemberRankList();
	
	public int insertMemberInfo(MemRegInfo memInfo) throws Exception;
}
