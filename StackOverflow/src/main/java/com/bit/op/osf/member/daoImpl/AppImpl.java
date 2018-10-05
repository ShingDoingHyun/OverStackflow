package com.bit.op.osf.member.daoImpl;

import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Repository;

import com.bit.op.osf.job.daoImpl.DaoImpl;
import com.bit.op.osf.member.app.model.AppFileInfo;
import com.bit.op.osf.member.app.model.AppInfo;
import com.bit.op.osf.member.dao.AppDao;

@Repository
public class AppImpl extends DaoImpl implements AppDao {
	
	private static final String NAMESPACE = "com.bit.op.osf.member.mapper.MemberAppMapper.";
	
	@Override
	public int insertAppInfo(AppInfo appInfo) {
		
		appInfo.setAppPhotoName(appInfo.getAppPhoto().getOriginalFilename());
		
		sqlSession.insert(NAMESPACE + "insertAppInfo", appInfo);
		return appInfo.getAppNO();
	}
	@Override
	public int insertAppFileInfo(List<AppFileInfo> appFileInfoList) {
	
		for(AppFileInfo appFileInfo :appFileInfoList) {
			
		sqlSession.insert(NAMESPACE + "insertAppFileInfo", appFileInfo);
		}
		return 1; 
		
	}

}



