package com.hotel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hotel.VO.roomVO;
import com.hotel.dao.IF_RoomDAO;
import com.hotel.dao.IF_Room_AttachDAO;

@Service
public class RoomServiceImpl implements IF_RoomService {
	
	@Inject
	IF_RoomDAO rdao;
	@Inject
	IF_Room_AttachDAO radao;

	@Override
	public void join_room_save(roomVO rvo) throws Exception {
		rdao.join_room_save(rvo);

		for(int i=0; i<rvo.getFilename_room().length; i++) {
			if(rvo.getFilename_room()[i]!=null) {
				
				radao.insertImg(rvo.getFilename_room()[i], rvo.getDetailAddr_roomNum_room());
			}
		}
	}

	@Override
	public List<roomVO> room_selectDetailAddr(String detailAddr_room) throws Exception {
		List<roomVO> roomList  = rdao.room_selectDetailAddr(detailAddr_room);
		for(int i=0; i<roomList.size(); i++) {
			String[] filename_room = new String[3];
			List<String> selectImg = radao.room_selectImg(roomList.get(i).getDetailAddr_roomNum_room());
			for(int j=0; j<selectImg.size(); j++) {
				filename_room[j] = selectImg.get(j);
			}
			roomList.get(i).setFilename_room(filename_room);
		}
	
		return roomList;
	}

	@Override
	public roomVO room_selectDetailAddr_roomNum(String detailAddr_roomNum_room) throws Exception {
		// TODO Auto-generated method stub
		roomVO rvo = rdao.room_selectDetailAddr_roomNum(detailAddr_roomNum_room);
		String[] filename_room = new String[3];
		List<String> selectImg = radao.room_selectImg(detailAddr_roomNum_room);
		for(int i=0; i<selectImg.size(); i++) {
			filename_room[i] = selectImg.get(i);
		}
		rvo.setFilename_room(filename_room);
		return rvo;
	}

	@Override
	public void update_room_save(roomVO rvo) throws Exception {
		// TODO Auto-generated method stub
		if(rvo.getFilename_room()[0]!=null) {
			radao.deleteImg(rvo.getDetailAddr_roomNum_room());
			for(int i=0; i<rvo.getFilename_room().length; i++) {
				if(rvo.getFilename_room()[i]!=null) {
					radao.insertImg(rvo.getFilename_room()[i], rvo.getDetailAddr_roomNum_room());
				}
			}
		}
		rdao.update_room_save(rvo);
		
		
	}

	@Override
	public void delete_room(String detailAddr_roomNum_room) throws Exception {
		rdao.delete_room(detailAddr_roomNum_room);
		
	}

	
	
}
