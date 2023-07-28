package com.hotel.dao;

import java.util.HashMap;
import java.util.List;

import com.hotel.VO.characterVO;

public interface IF_ChaDAO {
	public void insert(List<characterVO> chaList) throws Exception;
	public void insert_count(characterVO chavo) throws Exception;
	public List<String> select_cha_hotel(String detailAddr_hotel_character) throws Exception;
	public List<String> select_cha_user(String nowUser)throws Exception;
	public void already_insert(HashMap<String,String> hmap) throws Exception;
}
