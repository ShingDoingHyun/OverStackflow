package com.bit.op.osf.job.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.op.osf.job.model.ComMember;
import com.bit.op.osf.job.model.JobApplication;
import com.bit.op.osf.job.model.JobInfo;
import com.bit.op.osf.job.model.SearchJob;

public interface ComJobAppDao {
	
    public List<JobApplication> selectJobAppManageList(@Param("comId") String comId, @Param("jobNo") int jobNo, @Param("appResult") String appResult);
    
    public String updateAppResult(@Param("appNo") int appNo,@Param("appResult") String appResult, @Param("appResultDate") Date appResultDate);
    
    public String updateAppInterviewDate(@Param("appNo") int appNo,@Param("appInterviewDate") String appInterviewDate,@Param("appInterviewDateDate") Date appInterviewDateDate);
    
    public JobApplication selectAppResult(int appNo);
    
    public JobApplication selectAppInterviewDate(@Param("appNo") int appNo);
    
    public List<JobInfo> selectJobInfoListForApp(@Param("comId") String comId);
    
    public int countJobAppByJobNo(@Param("jobNo") int jobNo, @Param("comId") String comId, @Param("appResult") String appResult); //지원서 수 by JobNo
    
 
}
