
package com.bit.op.osf.job.daoImpl;

import java.sql.Connection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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

import com.bit.op.osf.job.dao.ComJobDao;
import com.bit.op.osf.job.model.ComMember;
import com.bit.op.osf.job.model.JobApplication;
import com.bit.op.osf.job.model.JobInfo;
import com.bit.op.osf.job.model.JobInfoListView;
import com.bit.op.osf.job.model.SearchJob;

@Repository
public class ComJobDaoImpl extends DaoImpl implements ComJobDao {
	
	int jobInfoTotalCount = 0;
	private static final int JOBINFO_COUNT_PER_PAGE = 10;
	private static final String NAMESPACE = "com.bit.op.osf.job.mapper.ComJobMapper.";

	@Override
	public ComMember selectComMember(String comId) {
		return sqlSession.selectOne(NAMESPACE + "selectComMember", comId);
	}
	
	@Override
	public String insertJobInfo(JobInfo jobInfo) {
		return sqlSession.selectOne(NAMESPACE + "insertJobInfo", jobInfo);
	}

	@Override
	public String insertJobType(String jobType, int jobNo) {
		Map map = new HashMap();
		map.put("jobType", jobType);
		map.put("jobNo", jobNo);
		return sqlSession.selectOne(NAMESPACE + "insertJobType", map);
	}
	
	//지워야 하는 것.
	public int selectJobno() {
		return sqlSession.selectOne(NAMESPACE + "selectJobno");
	}
	
	@Override
	public int countJobInfo(String comId){
		return sqlSession.selectOne(NAMESPACE + "countJobInfo", comId);
    }
	
	@Override
	public List<JobInfo> selectJobInfoList(int firstRow,int endRow, String comId) {
		Map map = new HashMap();
		map.put("firstRow", firstRow);
		map.put("endRow", endRow);
		map.put("comId", comId);
		return sqlSession.selectList(NAMESPACE + "selectJobInfoList", map);
	}
	
	//채용 공고 페이징 처리 메서드
	public JobInfoListView selectJobInfoListPage(int pageNumber, String comId, SearchJob search){
        JobInfoListView jobInfoListView = null;
        
        int currentPageNumber = 1;
        
        if(pageNumber > 0) {
        	currentPageNumber = pageNumber;
        }
        
        if(search.getOrder() == null) {
        	search.setOrder("jobRegisterDate");
        }
        
        System.out.println(comId);

        if(search.check()) {
        	jobInfoTotalCount = countJobInfoBySearch(comId, search);
        }else {
        	jobInfoTotalCount = countJobInfo(comId);
        }

        List<JobInfo> jobInfoList = null;
        int firstRow = 0;
        int endRow = 0;
        
        if(jobInfoTotalCount > 0) {
        	firstRow = (currentPageNumber -1)*JOBINFO_COUNT_PER_PAGE;
        	endRow = firstRow + JOBINFO_COUNT_PER_PAGE - 1;
        	
        	if(search.check()) {
        		jobInfoList = selectJobInfoListBySearch(firstRow, endRow, comId, search);
            }else {
            	jobInfoList = selectJobInfoList(firstRow, endRow, comId);
            }
        }else {
        	currentPageNumber = 0;
        	jobInfoList = Collections.emptyList();
        }
        
        jobInfoListView = new JobInfoListView(jobInfoTotalCount, jobInfoList, currentPageNumber, JOBINFO_COUNT_PER_PAGE, 
        		firstRow, endRow);
        
		return jobInfoListView;
    }
	
	
	@Override
	public JobInfo selectJobInfo(int jobNo) {
		return sqlSession.selectOne(NAMESPACE + "selectJobInfo", jobNo);
	}
	
	@Override
	public List selectJobTypeList(int jobNo) {
		return sqlSession.selectList(NAMESPACE + "selectJobTypeList", jobNo);
	}
	
    @Override
    public String updateJobInfo(JobInfo jobInfo){
       return sqlSession.selectOne(NAMESPACE + "updateJobInfo", jobInfo);
    }
    
    @Override
    public String deleteJobType(int jobNo) {
    	return sqlSession.selectOne(NAMESPACE + "deleteJobType", jobNo);
    }
    
    @Override
    public String updateJobInfoPeriod(int jobNo, Date now) {
    	Map map = new HashMap();
    	map.put("jobNo", jobNo);
    	map.put("now", now);
    	return sqlSession.selectOne(NAMESPACE + "updateJobInfoPeriod", map);
    }
	
    @Override
    public String deleteJobInfo(int jobNo) {
    	return sqlSession.selectOne(NAMESPACE + "deleteJobInfo", jobNo);
    }

	@Override
	public int countJobInfoBySearch(String comId, SearchJob search) {
		Map map = new HashMap();
		map.put("comId", comId);
		map.put("search", search);
		return sqlSession.selectOne(NAMESPACE + "countJobInfoBySearch", map);
	}
    
	@Override
	public List<JobInfo> selectJobInfoListBySearch(int firstRow,int endRow, String comId, SearchJob search) {
		Map map = new HashMap();
		map.put("firstRow", firstRow);
		map.put("endRow", endRow);
		map.put("comId", comId);
		map.put("search", search);
		return sqlSession.selectList(NAMESPACE + "selectJobInfoListBySearch", map);
	}
	
	@Override
	public List<JobApplication> selectJobAppManageList(String comId, int jobNo){
		Map map = new HashMap();
		map.put("comId", comId);
		map.put("jobNo", jobNo);
		return sqlSession.selectList(NAMESPACE + "selectJobAppManageList", map);
	}
	
	@Override
	public String updateAppResult(int appNo, String appResult, Date appResultDate) {
		Map map = new HashMap();
		map.put("appNo", appNo);
		map.put("appResult", appResult);
		map.put("appResultDate", appResultDate);
		return sqlSession.selectOne(NAMESPACE + "updateAppResult", map);
	}
	
	@Override
	public String updateAppInterviewDate(int appNo, String appInterviewDate, Date appInterviewDateDate) {
		Map map = new HashMap();
		map.put("appNo", appNo);
		map.put("appInterviewDate", appInterviewDate);
		map.put("appInterviewDateDate", appInterviewDateDate);
		return sqlSession.selectOne(NAMESPACE + "updateAppInterviewDate", map);
		
	}
	
	@Override
	public JobApplication selectAppResult(int appNo) {
		return sqlSession.selectOne(NAMESPACE + "selectAppResult", appNo); 
	}
	
	@Override
	public JobApplication selectAppInterviewDate(int appNo) {
		return sqlSession.selectOne(NAMESPACE + "selectAppInterviewDate", appNo); 
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
