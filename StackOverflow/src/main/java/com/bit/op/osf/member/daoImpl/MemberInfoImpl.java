package com.bit.op.osf.member.daoImpl;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.job.daoImpl.DaoImpl;
import com.bit.op.osf.member.SHA256.SHA256;
import com.bit.op.osf.member.dao.MemberInfoDao;
import com.bit.op.osf.member.model.MemRegInfo;

@Repository
public class MemberInfoImpl extends DaoImpl implements MemberInfoDao {

	

	@Autowired
	SHA256 SHA;

	private static final String MEMBERINFO_NAMESPACE = "com.bit.op.osf.member.mapper.MemberInfoMapper.";

	@Override
	public int insertMemberInfo(MemRegInfo memInfo, HttpServletRequest request) throws Exception {

		// 네임스페이스 + id + model

	//사진 넣는 작업
		int result = 0;
		// 저장용 파일 이름, 물리적저장, DB 저장용
		String imgName = "";

		// 1. 저장 경로 설정
		String uploadUri = "/resources/uploadFile/memberPhoto";

		// 2. 시스템의 물리적인 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		System.out.println("dir : " + dir);

		// 회원정보에 사진에 관한 정보가 있을 경우 = 파일을 첨부한경우
		if (!memInfo.getMemberPhotoFile().isEmpty()) {

			// 유저아이디_파일이름.jpg
			imgName = memInfo.getMemberId() + "_" + memInfo.getMemberPhotoFile().getOriginalFilename();

			System.out.println(dir);
			System.out.println(imgName);
			// 저장
			memInfo.getMemberPhotoFile().transferTo(new File(dir, imgName));
			// DB에 저장할 사진이름을 저장함 (SET)
			memInfo.setMemberPhoto(imgName);

		}

		String memberPw = SHA.encrypt(memInfo.getMemberPwd());
		memInfo.setMemberPwd(memberPw);

		
	// 네임스페이스 + id + model
	result = sqlSession.insert(MEMBERINFO_NAMESPACE + "insertMember", memInfo);
		System.out.println(result);
		return result;
	}

	@Override
	public MemRegInfo selectMember(String id, String pw) {

	
		// 비밀번호 SHA암호화로 변경
		System.out.println("pw       "+pw);  
		

	
		MemRegInfo memInfo = sqlSession.selectOne(MEMBERINFO_NAMESPACE +"selectId",id);
		System.out.println("memInfo       "+memInfo);  
		
		return memInfo;
	}
}
