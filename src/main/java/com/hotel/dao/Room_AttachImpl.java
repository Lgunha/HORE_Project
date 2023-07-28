package com.hotel.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Room_AttachImpl implements IF_Room_AttachDAO {
private static String mapperQuery= "com.hotel.dao.IF_Room_AttachDAO";
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public void insertImg(String filename, String detailAddr_roomNum_imgfile) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("filename", filename);
		map.put("detailAddr_roomNum_imgfile",detailAddr_roomNum_imgfile);
		sqlSession.insert(mapperQuery+".insertImg",map);
	}


	@Override
	public List<String> room_selectImg(String detailAddr_roomNum_imgfile) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".room_selectImg",detailAddr_roomNum_imgfile);
	}


	@Override
	public void deleteImg(String detailAddr_roomNum_imgfile) throws Exception {
		sqlSession.delete(mapperQuery+".deleteImg",detailAddr_roomNum_imgfile);
		
	}

}
