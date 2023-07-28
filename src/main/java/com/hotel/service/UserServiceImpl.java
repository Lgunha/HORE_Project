package com.hotel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hotel.VO.userVO;
import com.hotel.dao.IF_UserDAO;

@Service
public class UserServiceImpl implements IF_UserService{
	
	@Inject
	IF_UserDAO udao;

	@Override
	public void join_user_save(userVO vo) throws Exception {
		udao.join_user_save(vo);
	}

	@Override
	public List<userVO> user_selectAll(String id_user) throws Exception {
		// TODO Auto-generated method stub
		return udao.user_selectAll(id_user);
	}

	@Override
	public void delete_user(String id_user) throws Exception {
		udao.delete_user(id_user);
		
	}

	@Override
	public void update_user_save(userVO uvo) throws Exception {
		udao.update_user_save(uvo);
		
	}
	
}
