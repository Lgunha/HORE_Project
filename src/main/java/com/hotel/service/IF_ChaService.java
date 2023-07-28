package com.hotel.service;

import java.util.HashMap;
import java.util.List;

import com.hotel.VO.characterVO;

public interface IF_ChaService {
	public List<String> select_cha_hotel(String detailAddr_hotel_character) throws Exception;
	public void insert_count(List<characterVO> chaList) throws Exception;
	public List<String> select_cha_user(String nowUser)throws Exception;
	
	
}
