package com.hotel.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hotel.VO.characterVO;
import com.hotel.dao.IF_ChaDAO;

@Service
public class ChaServiceImpl implements IF_ChaService{
	@Inject
	IF_ChaDAO chadao;

	@Override
	public List<String> select_cha_hotel(String detailAddr_hotel_character) throws Exception {
		// TODO Auto-generated method stub
		return chadao.select_cha_hotel(detailAddr_hotel_character);
	}

	@Override
	public void insert_count(List<characterVO> chaList) throws Exception {
		String nowUser = chaList.get(0).getId_user_character();
		List<String> chaList_user =chadao.select_cha_user(nowUser); 
		
		for(int i=0; i<chaList.size(); i++) {
			boolean flag = true;
			String character = null;
			for(int j=0; j<chaList_user.size();j++) {
				if(chaList.get(i).getCharacter().equals(chaList_user.get(j))) {
					flag=false;
					character = chaList_user.get(j);
				}
			}
			if(!flag) {
				HashMap<String,String> hmap = new HashMap<String,String>();
				hmap.put("id_user_character", nowUser);
				hmap.put("character", character);
				chadao.already_insert(hmap);
			}else {
				chadao.insert_count(chaList.get(i));
			}
		}
	}

	@Override
	public List<String> select_cha_user(String nowUser) throws Exception {
		// TODO Auto-generated method stub
		return chadao.select_cha_user(nowUser);
	}
	
	
}
