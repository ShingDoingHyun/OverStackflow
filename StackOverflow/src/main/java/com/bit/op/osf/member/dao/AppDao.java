package com.bit.op.osf.member.dao;


import java.util.List;

import com.bit.op.osf.member.app.model.AppFileInfo;
import com.bit.op.osf.member.app.model.AppInfo;
import com.bit.op.osf.member.app.model.AppJobInfo;

public interface AppDao {
	  public int insertAppInfo(AppInfo appInfo);

	int insertAppFileInfo(List<AppFileInfo> appFileInfoList);
	int insertAppJobInfo(List<AppJobInfo> appJobInfoList);
	  

}
