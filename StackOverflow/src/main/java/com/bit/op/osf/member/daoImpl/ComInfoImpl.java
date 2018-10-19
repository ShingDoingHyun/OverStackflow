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
import com.bit.op.osf.member.dao.ComInfoDao;
import com.bit.op.osf.member.model.ComRegInfo;
import com.bit.op.osf.member.model.MemRegInfo;


@Repository
public class ComInfoImpl extends DaoImpl implements ComInfoDao {

	

	@Autowired
	SHA256 SHA;

	private static final String COMINFO_NAMESPACE = "com.bit.op.osf.member.mapper.ComInfoMapper.";

	private static final String MYPAGEINFO_NAMESPACE = "com.bit.op.osf.member.mapper.MyPageInfoMapper.";


	@Override
	public int insertComInfo(ComRegInfo comInfo, HttpServletRequest request) throws Exception {

		// 네임스페이스 + id + model

	//사진 넣는 작업
		int result = 0;
		// 저장용 파일 이름, 물리적저장, DB 저장용
		String imgName = "";

		// 1. 저장 경로 설정
		String uploadUri = "/resources/uploadFile/comPhoto";

		// 2. 시스템의 물리적인 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		System.out.println("dir : " + dir);

		// 회원정보에 사진에 관한 정보가 있을 경우 = 파일을 첨부한경우
		if (!comInfo.getComPhotoFile().isEmpty()) {

			// 유저아이디_파일이름.jpg
			imgName = comInfo.getComId() + "_" + comInfo.getComPhotoFile().getOriginalFilename();

			System.out.println(dir);
			System.out.println(imgName);
			// 저장
			comInfo.getComPhotoFile().transferTo(new File(dir, imgName));
			// DB에 저장할 사진이름을 저장함 (SET)
			comInfo.setComPhoto(imgName);

		}

		String comPw = SHA.encrypt(comInfo.getComPwd());
		comInfo.setComPwd(comPw);

		
	// 네임스페이스 + id + model
	result = sqlSession.insert(COMINFO_NAMESPACE + "insertCom", comInfo);
		System.out.println(result);
		return result;
	}

	
	
	
	@Override
	public int insertComInfo(ComRegInfo comInfo) throws Exception {

		// 네임스페이스 + id + model

	//사진 넣는 작업
		int result = 0;
		// 저장용 파일 이름, 물리적저장, DB 저장용
		String imgName = "";

	
		// 회원정보에 사진에 관한 정보가 있을 경우 = 파일을 첨부한경우
		if (!comInfo.getComPhotoFile().isEmpty()) {

			// 유저아이디_파일이름.jpg
			imgName = comInfo.getComId() + "_" + comInfo.getComPhotoFile().getOriginalFilename();

			System.out.println(imgName);
			// 저장
			comInfo.getComPhotoFile().transferTo(new File(comInfo.getRealPath(), imgName));
			// DB에 저장할 사진이름을 저장함 (SET)
			comInfo.setComPhoto(imgName);

		}

		String comPw = SHA.encrypt(comInfo.getComPwd());
		comInfo.setComPwd(comPw);

		
	// 네임스페이스 + id + model
	result = sqlSession.insert(COMINFO_NAMESPACE + "insertCom", comInfo);
		System.out.println(result);
		return result;
	}
	
	@Override
	public ComRegInfo selectCom(String id, String pw) {

	
		// 비밀번호 SHA암호화로 변경
		System.out.println("pw       "+pw);  
		

		ComRegInfo comInfo = sqlSession.selectOne(COMINFO_NAMESPACE +"selectId",id);
		System.out.println("comInfo       "+comInfo);  
		
		return comInfo;
	}


	@Override
	public int comProfileUpdate(ComRegInfo comInfo, HttpServletRequest request) throws Exception {
		String comPw = SHA.encrypt(comInfo.getComPwd());
		comInfo.setComPwd(comPw);

		
		int result = 0;
		// 저장용 파일 이름, 물리적저장, DB 저장용
		String imgName = "";

		// 1. 저장 경로 설정
		String uploadUri = "/resources/uploadFile/comPhoto";

		// 2. 시스템의 물리적인 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		System.out.println("dir : " + dir);

		// 회원정보에 사진에 관한 정보가 있을 경우 = 파일을 첨부한경우
		if (!comInfo.getComPhotoFile().isEmpty()) {

			// 유저아이디_파일이름.jpg
			imgName = comInfo.getComId() + "_" + comInfo.getComPhotoFile().getOriginalFilename();

			System.out.println(dir);
			System.out.println(imgName);
			// 저장
			comInfo.getComPhotoFile().transferTo(new File(dir, imgName));
			// DB에 저장할 사진이름을 저장함 (SET)
			comInfo.setComPhoto(imgName);

		}
		
	return	sqlSession.update(MYPAGEINFO_NAMESPACE+"comProfileUpdate",comInfo);
	}




	
}
