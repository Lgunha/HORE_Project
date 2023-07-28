package com.hotel.dao;

import java.util.HashMap;
import java.util.List;

import com.hotel.VO.reservationVO;

import jdk.nashorn.internal.runtime.ECMAErrors;

public interface IF_ReservationDAO {
	public void reservation_save(reservationVO resvo) throws Exception;
	public List<reservationVO> reservation_selectAll(String detail_roomNum_res) throws Exception; 
	public List<reservationVO> reservation_selectID(String id_res) throws Exception;
	public void reservation_autoDelete() throws Exception;
	public void reservation_delete(HashMap<String,String> hmap) throws Exception;
	public List<reservationVO> reservation_selectDetailAddr(String detailAddr) throws Exception;
	
	public List<reservationVO> do_reservation_select() throws Exception;
	public void do_reservation_autoSave(reservationVO resvo) throws Exception;
}
