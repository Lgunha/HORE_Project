package com.hotel.dao;

import java.util.List;

public interface IF_Room_AttachDAO {
	public void insertImg(String filename,String detailAddr_roomNum_imgfile) throws Exception;
	public List<String> room_selectImg(String detailAddr_roomNum_imgfile) throws Exception;
	public void deleteImg(String detailAddr_roomNum_imgfile) throws Exception;
	
}
