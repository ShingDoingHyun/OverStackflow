package com.bit.op.osf.job.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.op.osf.job.model.ComMember;
import com.bit.op.osf.job.model.JobApplication;
import com.bit.op.osf.job.model.JobInfo;
import com.bit.op.osf.job.model.SearchJob;

public interface ComJobDao {
	
	public ComMember selectComMember(@Param("comId") String comId);

    public String insertJobInfo(JobInfo jobInfo);
    
    public String insertJobType(@Param("jobType") String jobType, @Param("jobNo") int jobNo);
    
    public List<JobInfo> selectJobInfoList(@Param("firstRow") int firstRow,@Param("endRow") int endRow, @Param("comId") String comId);
    
    public int countJobInfo(@Param("comId") String comId);

    public JobInfo selectJobInfo(int jobNo);
    
    public List<String> selectJobTypeList(int jobNo);
    
    public String updateJobInfo(JobInfo jobInfo);
    
    public String deleteJobType(int jobNo);
    
    public String updateJobInfoPeriod(@Param("jobNo") int jobNo, @Param("now") Date now);
    
    public String deleteJobInfo(int jobNo);
    
    public int countJobInfoBySearch(@Param("comId") String comId, @Param("search") SearchJob search);
    
    public List<JobInfo> selectJobInfoListBySearch(@Param("firstRow") int firstRow,@Param("endRow") int endRow, @Param("comId") String comId, @Param("search") SearchJob search);

    public List<JobApplication> selectJobAppManageList(@Param("comId") String comId, @Param("jobNo") int jobNo);
    
    public String updateAppResult(int appNo, String appResult);
    
   /* public JobInfo selectJobInfo(int jobSeqNum);*/

  /* 

    
    public int countJobInfoManage(String comId, String endedJob);

    public List<JobInfo> selectJobInfoManageList(String comId, int firstRow, int endRow, String endedJob);

    public int updateJobInfo(JobInfo jobInfo);

    public int updateJobInfoPeriod(int jobSeqNum, Date jobDueDate);

    public int deleteJobInfo(int jobSeqNum);
*/
}
