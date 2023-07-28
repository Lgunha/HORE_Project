package com.hotel.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hotel.VO.reservationVO;
import com.hotel.dao.IF_ReservationDAO;

@Service
public class ReservationServiceImpl implements IF_ReservationService{
	
	@Inject
	IF_ReservationDAO resdao;

	@Override
	public void reservation_save(reservationVO resvo) throws Exception {
		resdao.reservation_save(resvo);
		
	}
	@Override
	public List<reservationVO> reservation_selectAll(String detail_roomNum_res) throws Exception {
	   // TODO Auto-generated method stub
	   return resdao.reservation_selectAll(detail_roomNum_res);
	}
	@Override
	public List<reservationVO> reservation_selectID(String id_res) throws Exception {
		// TODO Auto-generated method stub
		return resdao.reservation_selectID(id_res);
	}
	@Override
	public void reservation_autoDelete() throws Exception {
		List<reservationVO> resList = resdao.do_reservation_select();
		if(resList.size()>0) {
			for(reservationVO resvo : resList) {
				resdao.do_reservation_autoSave(resvo);
				
			}
		}
		resdao.reservation_autoDelete();
	}
	@Override
	public void reservation_delete(HashMap<String, String> hmap) throws Exception {
		resdao.reservation_delete(hmap);
		
	}
	@Override
	public List<reservationVO> reservation_selectDetailAddr(String detailAddr) throws Exception {
		// TODO Auto-generated method stub
		
		return resdao.reservation_selectDetailAddr(detailAddr);
	}
}
