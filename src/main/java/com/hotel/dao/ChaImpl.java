package com.hotel.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hotel.VO.characterVO;

@Repository
public class ChaImpl implements IF_ChaDAO{
private static String mapperQuery= "com.hotel.dao.IF_ChaDAO";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void insert(List<characterVO> chaList) throws Exception {
		// TODO Auto-generated method stub
		for(characterVO cvo: chaList) {
			sqlSession.insert(mapperQuery+".insert", cvo);
		}
	}

	@Override
	public void insert_count(characterVO chavo) throws Exception {
		
		sqlSession.insert(mapperQuery+".insert_count", chavo);
		
	}

	@Override
	public List<String> select_cha_hotel(String detailAddr_hotel_character) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".select_cha_hotel", detailAddr_hotel_character);
	}

	@Override
	public List<String> select_cha_user(String nowUser) throws Exception {
		
		return sqlSession.selectList(mapperQuery+".select_cha_user", nowUser);
	}

	@Override
	public void already_insert(HashMap<String, String> hmap) throws Exception {
		sqlSession.update(mapperQuery+".already_insert",hmap);
		
	}
}
