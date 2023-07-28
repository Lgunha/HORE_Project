package com.hotel.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hotel.VO.roomVO;

@Repository
public class RoomImpl implements IF_RoomDAO{
	
	private static String mapperQuery= "com.hotel.dao.IF_RoomDAO";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void join_room_save(roomVO rvo) throws Exception {
		sqlSession.insert(mapperQuery+".join_room_save",rvo);
		
	}

	@Override
	public List<roomVO> room_selectDetailAddr(String detailAddr_room) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".room_selectDetailAddr", detailAddr_room);
	}

	@Override
	public roomVO room_selectDetailAddr_roomNum(String detailAddr_roomNum_room) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".room_selectDetailAddr_roomNum", detailAddr_roomNum_room);
	}

	@Override
	public void update_room_save(roomVO rvo) throws Exception {
		sqlSession.update(mapperQuery+".update_room_save",rvo);
		
	}

	@Override
	public void delete_room(String detailAddr_roomNum_room) throws Exception {
		sqlSession.delete(mapperQuery+".delete_room",detailAddr_roomNum_room);
		
	}

}
