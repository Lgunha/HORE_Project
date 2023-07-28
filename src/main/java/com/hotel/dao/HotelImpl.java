package com.hotel.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hotel.VO.hotelVO;

@Repository
public class HotelImpl implements IF_HotelDAO{
	
	private static String mapperQuery= "com.hotel.dao.IF_HotelDAO";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void join_hotel_save(hotelVO vo) throws Exception {
		sqlSession.insert(mapperQuery+".join_hotel_save",vo);
		
	}

	@Override
	public List<hotelVO> hotel_selectAll(String category) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".hotel_selectAll",category);
	}

	@Override
	public List<String> hotel_selectCategory() throws Exception {
		
		return sqlSession.selectList(mapperQuery+".hotel_selectCategory");
	}

	@Override
	public hotelVO hotel_selectDetailAddr(String detailAddr_hotel) throws Exception {
		
		return sqlSession.selectOne(mapperQuery+".hotel_selectDetailAddr", detailAddr_hotel);
	}

	@Override
	public List<hotelVO> search_hotel(HashMap<String, String> hmap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".search_hotel", hmap);
	}

	@Override
	public List<hotelVO> hotel_select_my(String id_user) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".hotel_select_my", id_user);
	}

	@Override
	public void update_hotel_save(hotelVO hvo) throws Exception {
		sqlSession.update(mapperQuery+".update_hotel_save",hvo);
		
	}

	@Override
	public void delete_hotel(String detailAddr_hotel) throws Exception {
		sqlSession.delete(mapperQuery+".delete_hotel",detailAddr_hotel);
		
	}

	@Override
	public List<hotelVO> hotel_selectBigAddr(String bigAddr_hotel) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".hotel_selectBigAddr", bigAddr_hotel);
	}








}
