package com.hotel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hotel.VO.userVO;

@Repository
public class UserImpl implements IF_UserDAO{
	private static String mapperQuery= "com.hotel.dao.IF_UserDAO";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void join_user_save(userVO vo) throws Exception {
		sqlSession.insert(mapperQuery+".join_user_save",vo);
		
	}

	@Override
	public List<userVO> user_selectAll(String id_user) throws Exception {
		
		return sqlSession.selectList(mapperQuery+".user_selectAll",id_user);
	}

	@Override
	public void delete_user(String id_user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".delete_user",id_user);
	}

	@Override
	public void update_user_save(userVO uvo) throws Exception {
		sqlSession.update(mapperQuery+".update_user_save",uvo);
		
	}
	
}
