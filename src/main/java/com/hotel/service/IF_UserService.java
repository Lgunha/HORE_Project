package com.hotel.service;

import java.util.List;

import com.hotel.VO.userVO;

public interface IF_UserService {
	public void join_user_save(userVO vo) throws Exception;
	public List<userVO> user_selectAll(String id_user) throws Exception;
	public void delete_user(String id_user) throws Exception;
	public void update_user_save(userVO uvo) throws Exception;
}
