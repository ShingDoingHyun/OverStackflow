package com.bit.op.osf.job.dao;

import com.bit.op.osf.job.model.JobInfo;

public interface ComJobDao {

    public String insertJobInfo(JobInfo jobInfo);

   /* public JobInfo selectJobInfo(int jobSeqNum);*/

  /*  public int countJobInfo(SearchJob searchJob);

    public List<JobInfo> selectJobInfoList(SearchJob searchJob, int firstRow, int endRow);

    public int countJobInfoManage(String comId, String endedJob);

    public List<JobInfo> selectJobInfoManageList(String comId, int firstRow, int endRow, String endedJob);

    public int updateJobInfo(JobInfo jobInfo);

    public int updateJobInfoPeriod(int jobSeqNum, Date jobDueDate);

    public int deleteJobInfo(int jobSeqNum);
*/
}
