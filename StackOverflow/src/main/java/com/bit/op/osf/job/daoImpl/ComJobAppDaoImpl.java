
package com.bit.op.osf.job.daoImpl;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.cursor.Cursor;
import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.op.osf.job.dao.ComJobAppDao;
import com.bit.op.osf.job.dao.ComJobDao;
import com.bit.op.osf.job.model.ComMember;
import com.bit.op.osf.job.model.JobApplication;
import com.bit.op.osf.job.model.JobInfo;
import com.bit.op.osf.job.model.JobInfoListView;
import com.bit.op.osf.job.model.SearchJob;
import com.bit.op.osf.member.model.ComRegInfo;
import com.bit.op.osf.member.model.MemRegInfo;

@Repository
public class ComJobAppDaoImpl extends DaoImpl implements ComJobAppDao {
	
	int jobInfoTotalCount = 0;
	private static final int JOBINFO_COUNT_PER_PAGE = 10;
	private static final int MYJOBINFO_COUNT_PER_PAGE = 6;
	private static final String JOBAPPNAMESPACE = "com.bit.op.osf.job.mapper.ComJobAppMapper.";

	@Override
	public List<JobApplication> selectJobAppManageList(String comId, int jobNo, String appResult){
		Map map = new HashMap();
		map.put("comId", comId);
		map.put("jobNo", jobNo);
		map.put("appResult", appResult);
		System.out.println("appResult는"+appResult+","+jobNo);
		return sqlSession.selectList(JOBAPPNAMESPACE + "selectJobAppManageList", map);
	}
	
	@Override
	public String updateAppResult(int appNo, String appResult, Date appResultDate) {
		Map map = new HashMap();
		map.put("appNo", appNo);
		map.put("appResult", appResult);
		map.put("appResultDate", appResultDate);
		return sqlSession.selectOne(JOBAPPNAMESPACE + "updateAppResult", map);
	}
	
	@Override
	public String updateAppInterviewDate(int appNo, String appInterviewDate, Date appInterviewDateDate) {
		Map map = new HashMap();
		map.put("appNo", appNo);
		map.put("appInterviewDate", appInterviewDate);
		map.put("appInterviewDateDate", appInterviewDateDate);
		return sqlSession.selectOne(JOBAPPNAMESPACE + "updateAppInterviewDate", map);
		
	}
	
	@Override
	public JobApplication selectAppResult(int appNo) {
		return sqlSession.selectOne(JOBAPPNAMESPACE + "selectAppResult", appNo); 
	}
	
	@Override
	public JobApplication selectAppInterviewDate(int appNo) {
		return sqlSession.selectOne(JOBAPPNAMESPACE + "selectAppInterviewDate", appNo); 
	}
	
	//지원서 관리를 위해 불러오는 JobInfoList without Paging
	@Override
	public List<JobInfo> selectJobInfoListForApp(String comId) {
		return sqlSession.selectList(JOBAPPNAMESPACE + "selectJobInfoListForApp", comId);
	}
	
	@Override
	public int countJobAppByJobNo(int jobNo, String comId, String appResult) {
		Map map = new HashMap();
		map.put("jobNo", jobNo);
		map.put("comId", comId);
		map.put("appResult", appResult);
		return sqlSession.selectOne(JOBAPPNAMESPACE + "countJobAppByJobNo", map) == null? 0 :  sqlSession.selectOne(JOBAPPNAMESPACE + "countJobAppByJobNo", map);
	}

	public Map countJobAppForGraph(String comId,int jobNo, String appResult) {
		Map map = new HashMap();
		Map ageMap = new HashMap();
		ageMap.put("jobNo", jobNo);
		ageMap.put("comId", comId);
		ageMap.put("appResult", appResult);
		
		map.put("allNum", countJobAppByJobNo(jobNo, comId, appResult));
		map.put("avgAge", sqlSession.selectOne(JOBAPPNAMESPACE + "countJobAge", ageMap)); 
		map.put("sumF",sqlSession.selectOne(JOBAPPNAMESPACE + "countFnum", ageMap));
		map.put("sumM", sqlSession.selectOne(JOBAPPNAMESPACE + "countMnum", ageMap));
		map.put("eduLevel", sqlSession.selectList(JOBAPPNAMESPACE + "countEduLevel", ageMap));
		return map;
	}
	
	
	/*
    public List<JobInfo> selectJobInfoList(SearchJob searchJob, int firstRow, int endRow){
        return null;
    }

    public JobInfoListView selectJobInfoListPage(SearchJob searchJob, int pageNumber){
        return null;
    }

    public int countJobInfoManage(String comId, String endedJob){
        return 0;
    }

    public List<JobInfo> selectJobInfoManageList(String comId, int firstRow, int endRow, String endedJob){
        return null;
    }

    public JobInfoListView selectJobInfoManageListPage(String comId, int pageNumber, String endedJob){
        return null;
    }

 

    public int updateJobInfoPeriod(int jobSeqNum, Date jobDueDate){
        return 0;
    }

    public int deleteJobInfo(int jobSeqNum){
        return 0;
    }

    public ComManageAppCount countJobInfoManageByState(String comId, String endedJob){
        return null;
    }*/

}
