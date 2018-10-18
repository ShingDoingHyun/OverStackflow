package com.bit.op.osf.member.daoImpl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.job.daoImpl.DaoImpl;
import com.bit.op.osf.member.SHA256.SHA256;
import com.bit.op.osf.member.dao.MemberInfoDao;
import com.bit.op.osf.member.dao.MyPageInfoDao;
import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.ReplyBoard;

@Repository
public class MyPageInfoImpl extends DaoImpl implements MyPageInfoDao {

	@Autowired
	SHA256 SHA;


	private static final String MYPAGEINFO_NAMESPACE = "com.bit.op.osf.member.mapper.MyPageInfoMapper.";

	
	
	@Override
	public List<ReplyBoard> selectAnswerInfo(String memId) throws Exception {

		List<ReplyBoard>  replyBoards = sqlSession.selectList(MYPAGEINFO_NAMESPACE+"selectReplyMember", memId);
	
		return replyBoards;
	}

	
	@Override
	public List<QuestionBoard> selectQuestionInfo(String memId) throws Exception {
		
		List<QuestionBoard>  questionBoards = sqlSession.selectList(MYPAGEINFO_NAMESPACE+"selectQuestionMember", memId);
		return questionBoards;
	}

	
	@Override
	public int memberProfileUpdate(MemRegInfo memInfo, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
				
		String memberPw = SHA.encrypt(memInfo.getMemberPwd());
		memInfo.setMemberPwd(memberPw);

		
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
		
		 //  지우고 
		//  
		
		//  넣어주고
/*
		imgName =  memInfo.getMemberId() + "_" + memInfo.getMemberPhotoFile().getOriginalFilename();
		System.out.println();
		
		// 저장
					memInfo.getMemberPhotoFile().transferTo(new File(memInfo.getRealPath(), imgName));
					// DB에 저장할 사진이름을 저장함 (SET)
					memInfo.setMemberPhoto(imgName);*/
		
	return	sqlSession.update(MYPAGEINFO_NAMESPACE+"memberProfileUpdate",memInfo);
	}
}
