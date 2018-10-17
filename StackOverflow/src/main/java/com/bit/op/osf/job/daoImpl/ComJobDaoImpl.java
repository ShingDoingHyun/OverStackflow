
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
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.op.osf.job.dao.ComJobDao;
import com.bit.op.osf.job.model.ComMember;
import com.bit.op.osf.job.model.JobApplication;
import com.bit.op.osf.job.model.JobInfo;
import com.bit.op.osf.job.model.JobInfoListView;
import com.bit.op.osf.job.model.SearchJob;
import com.bit.op.osf.member.model.ComRegInfo;
import com.bit.op.osf.member.model.MemRegInfo;

@Service("ComJobDaoImpl")
@Repository
public class ComJobDaoImpl extends DaoImpl implements ComJobDao {
	
	int jobInfoTotalCount = 0;
	private static final int JOBINFO_COUNT_PER_PAGE = 10;
	private static final int MYJOBINFO_COUNT_PER_PAGE = 6;
	private static final String JOBNAMESPACE = "com.bit.op.osf.job.mapper.ComJobMapper.";

	@Override
	public ComMember selectComMember(String comId) {
		return sqlSession.selectOne(JOBNAMESPACE + "selectComMember", comId);
	}
	
	@Override
	public String insertJobInfo(JobInfo jobInfo) {
		return sqlSession.selectOne(JOBNAMESPACE + "insertJobInfo", jobInfo);
	}

	@Override
	public String insertJobType(String jobType, int jobNo) {
		Map map = new HashMap();
		map.put("jobType", jobType);
		map.put("jobNo", jobNo);
		return sqlSession.selectOne(JOBNAMESPACE + "insertJobType", map);
	}
	
	//지워야 하는 것.
	public int selectJobno() {
		return sqlSession.selectOne(JOBNAMESPACE + "selectJobno");
	}
	
	@Override
	public int countJobInfo(String comId){
		return sqlSession.selectOne(JOBNAMESPACE + "countJobInfo", comId);
    }
	
	@Override
	public List<JobInfo> selectJobInfoList(int firstRow,int endRow, String comId) {
		Map map = new HashMap();
		map.put("firstRow", firstRow);
		map.put("endRow", endRow);
		map.put("comId", comId);
		return sqlSession.selectList(JOBNAMESPACE + "selectJobInfoList", map);
	}
	
	//채용 공고 페이징 처리 메서드
	public JobInfoListView selectJobInfoListPage(int pageNumber, String comId, SearchJob search, HttpServletRequest request){
        JobInfoListView jobInfoListView = null;
        
        int currentPageNumber = 1;
        
        if(pageNumber > 0) {
        	currentPageNumber = pageNumber;
        }

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
        		 if(search.getOrder() == null) {
        	        	search.setOrder("jobRegisterDate");
        	     }
        		jobInfoList = selectJobInfoListBySearch(firstRow, endRow, comId, search);
            }else {
            	jobInfoList = selectJobInfoList(firstRow, endRow, comId);
            }
        }else {
        	currentPageNumber = 0;
        	jobInfoList = Collections.emptyList();
        }
        
        ComRegInfo comInfo =  (ComRegInfo) request.getSession().getAttribute("comInfo");

        for(JobInfo jobInfo : jobInfoList) {
        	
        	int jobNo = jobInfo.getJobNo();
        	ComMember com = sqlSession.selectOne(JOBNAMESPACE + "selectJobInfoCom", jobNo);
        	jobInfo.setComName(com.getComName());
        	
        	if(comInfo != null) {
	        	if(comInfo.getComId() != null) {
	        		
	        	Map map = new HashMap();
	        	map.put("jobNo", jobInfo.getJobNo());
	        	map.put("comId", comInfo.getComId());
	        	
	        	System.out.println("잡넘버" + jobInfo.getJobNo() + "아이디" + comId);
	        	jobInfo.setFavJobInfo(sqlSession.selectOne(JOBNAMESPACE + "selectFavJob", map)!=null? 1: 0);
	        	System.out.println(jobInfo.getFavJobInfo());
	        	
	        	}
        	}
        }
        
        jobInfoListView = new JobInfoListView(jobInfoTotalCount, jobInfoList, currentPageNumber, JOBINFO_COUNT_PER_PAGE, 
        		firstRow, endRow);
        
		return jobInfoListView;
    }
	
	//채용공고 목록 페이지의 나의 채용 공고 페이징 처리 메서드
		public JobInfoListView selectMyJobInfoList(int pageNumber, String comId){
	        JobInfoListView jobInfoListView = null;
	        
	        int currentPageNumber = 1;
	        
	        if(pageNumber > 0) {
	        	currentPageNumber = pageNumber;
	        }
	      
	        System.out.println(comId);

	        jobInfoTotalCount = countJobInfo(comId);
	        
	        List<JobInfo> jobInfoList = null;
	        int firstRow = 0;
	        int endRow = 0;
	        
	        if(jobInfoTotalCount > 0) {
	        	firstRow = (currentPageNumber -1)*MYJOBINFO_COUNT_PER_PAGE;
	        	endRow = firstRow + MYJOBINFO_COUNT_PER_PAGE - 1;
	        	
	            jobInfoList = selectJobInfoList(firstRow, endRow, comId);

	        }else {
	        	currentPageNumber = 0;
	        	jobInfoList = Collections.emptyList();
	        }
	        
	        jobInfoListView = new JobInfoListView(jobInfoTotalCount, jobInfoList, currentPageNumber, MYJOBINFO_COUNT_PER_PAGE, 
	        		firstRow, endRow);

			return jobInfoListView;
	    }
	
	
	@Override
	public JobInfo selectJobInfo(int jobNo) {
		return sqlSession.selectOne(JOBNAMESPACE + "selectJobInfo", jobNo);
	}
	
	@Override
	public ComMember selectJobInfoCom(int jobNo) {
		return sqlSession.selectOne(JOBNAMESPACE + "selectJobInfoCom", jobNo);
	}
	
	@Override
	public List selectJobTypeList(int jobNo) {
		return sqlSession.selectList(JOBNAMESPACE + "selectJobTypeList", jobNo);
	}
	
    @Override
    public String updateJobInfo(JobInfo jobInfo){
       return sqlSession.selectOne(JOBNAMESPACE + "updateJobInfo", jobInfo);
    }
    
    @Override
    public String deleteJobType(int jobNo) {
    	return sqlSession.selectOne(JOBNAMESPACE + "deleteJobType", jobNo);
    }
    
    @Override
    public String updateJobInfoPeriod(int jobNo, Date now) {
    	Map map = new HashMap();
    	map.put("jobNo", jobNo);
    	map.put("now", now);
    	
    	Date cur = new Date();
    	int compare = now.compareTo(cur);
    	if(compare > 0) {
    		sqlSession.selectOne(JOBNAMESPACE + "updateEndedDateForN", jobNo);
    	}else {
    		sqlSession.selectOne(JOBNAMESPACE + "updateEndedDateForY", jobNo);
    	}
    	return sqlSession.selectOne(JOBNAMESPACE + "updateJobInfoPeriod", map);
    }
    
	
    @Override
    public String deleteJobInfo(int jobNo) {
    	return sqlSession.selectOne(JOBNAMESPACE + "deleteJobInfo", jobNo);
    }

	@Override
	public int countJobInfoBySearch(String comId, SearchJob search) {
		Map map = new HashMap();
		map.put("comId", comId);
		map.put("search", search);
		return sqlSession.selectOne(JOBNAMESPACE + "countJobInfoBySearch", map);
	}
    
	@Override
	public List<JobInfo> selectJobInfoListBySearch(int firstRow,int endRow, String comId, SearchJob search) {
		Map map = new HashMap();
		map.put("firstRow", firstRow);
		map.put("endRow", endRow);
		map.put("comId", comId);
		map.put("search", search);
		return sqlSession.selectList(JOBNAMESPACE + "selectJobInfoListBySearch", map);
	}
	
	
	//채용공고 즐겨찾기 추가
	public int changeFavJobInfo(JobInfo jobInfo) {
		int a = sqlSession.delete(JOBNAMESPACE + "deleteFavJobInfo", jobInfo);
		System.out.println("결과?" + a);
		if(a<=0) {
			sqlSession.insert(JOBNAMESPACE + "insertFavJobInfo", jobInfo);
			return 1;
		}else {		
			return 0;
		}
	}
	
	//채용공고 즐겨찾기 리스트 불러오기
	public List<JobInfo> selectFavJobInfoList(HttpServletRequest request){
		ComRegInfo comInfo = (ComRegInfo) request.getSession().getAttribute("comInfo");
		return sqlSession.selectList(JOBNAMESPACE + "selectFavJobInfoList", comInfo);
	}
	
	//채용공고 쿠키 불러오기
    public List<JobInfo> selectVisitJobInfo(Cookie[] cookies){
    	
			List<JobInfo> visitJobInfoList = new ArrayList<JobInfo>();
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("visitJobInfo")) {
					String[] visitJobInfoArr = cookies[i].getValue().split("%2C");
					
					List<String> list = Arrays.asList(visitJobInfoArr);
					Collections.reverse(list);
					visitJobInfoArr = list.toArray(new String[list.size()]);
					
					int length = visitJobInfoArr.length < 5? visitJobInfoArr.length : 5;
					
					for(int index=0; index < length; index++) {
						if(visitJobInfoArr[index] != null && visitJobInfoArr[index] !="") {
						System.out.println(index);
						JobInfo jobInfo = new JobInfo();
						System.out.println("visit" + visitJobInfoArr[index]);
						jobInfo.setJobNo(Integer.parseInt(visitJobInfoArr[index]));
						visitJobInfoList.add(jobInfo);
						}
				}
			}
        }
    	
    	for(JobInfo jobInfo : visitJobInfoList) {
    		jobInfo.setJobTitle(sqlSession.selectOne(JOBNAMESPACE + "selectVisitJobInfo", jobInfo.getJobNo()));
    	}
    	return visitJobInfoList;
    }

	@Override
	public void setEndedJob() {
		sqlSession.selectOne(JOBNAMESPACE + "updateEndedDateForAuto");
		System.out.println("done with endedJob");
	}
}
