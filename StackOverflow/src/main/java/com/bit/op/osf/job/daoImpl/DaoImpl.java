package com.bit.op.osf.job.daoImpl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public abstract class DaoImpl {
	
	@Inject
	protected SqlSession sqlSession;

}
