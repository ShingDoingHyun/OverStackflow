package com.bit.op.osf.member.dao;


import java.util.List;

import com.bit.op.osf.member.app.model.AppFileInfo;
import com.bit.op.osf.member.app.model.AppInfo;

public interface AppDao {
	  public int insertAppInfo(AppInfo appInfo);

	int insertAppFileInfo(List<AppFileInfo> appFileInfoList);
	  

}
