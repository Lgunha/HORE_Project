package com.hotel.VO;

public class roomVO {
	
	private String detailAddr_roomNum_room ;
	private String detailAddr_room ;
	private String roomNum_room;
	private String info_room;
	private String[] filename_room;
	private String checkIn_room;
	private String checkOut_room;
	private String price_room;
	private int days;
	
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public String getPrice_room() {
		return price_room;
	}
	public void setPrice_room(String price_room) {
		this.price_room = price_room;
	}
	public String getCheckIn_room() {
		return checkIn_room;
	}
	public void setCheckIn_room(String checkIn_room) {
		this.checkIn_room = checkIn_room;
	}
	public String getCheckOut_room() {
		return checkOut_room;
	}
	public void setCheckOut_room(String checkOut_room) {
		this.checkOut_room = checkOut_room;
	}
	public String getDetailAddr_roomNum_room() {
		return detailAddr_roomNum_room;
	}
	public void setDetailAddr_roomNum_room(String detailAddr_roomNum_room) {
		this.detailAddr_roomNum_room = detailAddr_roomNum_room;
	}
	public String getDetailAddr_room() {
		return detailAddr_room;
	}
	public void setDetailAddr_room(String detailAddr_room) {
		this.detailAddr_room = detailAddr_room;
	}
	public String getRoomNum_room() {
		return roomNum_room;
	}
	public void setRoomNum_room(String roomNum_room) {
		this.roomNum_room = roomNum_room;
	}
	public String getInfo_room() {
		return info_room;
	}
	public void setInfo_room(String info_room) {
		this.info_room = info_room;
	}
	public String[] getFilename_room() {
		return filename_room;
	}
	public void setFilename_room(String[] filename_room) {
		this.filename_room = filename_room;
	}
	
}
