
package com.bit.op.osf.job.daoImpl;

import java.sql.Connection;
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

import com.bit.op.osf.job.dao.ComJobDao;
import com.bit.op.osf.job.model.JobInfo;

@Repository
public class ComJobDaoImpl extends DaoImpl implements ComJobDao {
	
	private static final String NAMESPACE = "com.bit.op.osf.job.mapper.ComJobMapper.";
	
	@Override
	public String insertJobInfo(JobInfo jobInfo) {
		return sqlSession.selectOne(NAMESPACE + "insertJobInfo", jobInfo);
	}

	/*@Override
	public JobInfo selectJobInfo(int jobSeqNum) {
		// TODO Auto-generated method stub
		return null;
	}

    public JobInfo selectJobInfo(int jobSeqNum){
        return null;
    }

    public int countJobInfo(SearchJob searchJob){
        return 0;
    }

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

    public int updateJobInfo(JobInfo jobInfo){
        return 0;
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
