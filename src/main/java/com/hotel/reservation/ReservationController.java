package com.hotel.reservation;

import static java.time.temporal.ChronoUnit.DAYS;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.VO.reservationVO;
import com.hotel.VO.roomVO;
import com.hotel.VO.userVO;
import com.hotel.service.IF_HotelService;
import com.hotel.service.IF_ReservationService;
import com.hotel.service.IF_RoomService;
import com.hotel.service.IF_UserService;
import com.hotel.util.FileDataUtil;
@Controller
public class ReservationController {
	@Inject
	IF_UserService usersrv;
	@Inject
	IF_HotelService hotelsrv;
	@Inject
	IF_RoomService roomsrv;
	@Inject
	FileDataUtil filedatautil;
	@Inject
	IF_ReservationService ressrv;
	
	//예약 폼 이동
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	   public String reservation(Locale locale, Model model, @RequestParam("detailAddr_roomNum_room")String detailAddr_roomNum_room,
			   @RequestParam("checkIn")String checkIn,
			   @RequestParam("checkOut")String checkOut) throws Exception {
	      roomVO rvo = roomsrv.room_selectDetailAddr_roomNum(detailAddr_roomNum_room);
	      // 편의시설dao, service, mapper 작업 후 편의시설vo 넘겨받기
	      
	      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	      LocalDate date1 = LocalDate.parse(checkIn, formatter);
	      LocalDate date2 = LocalDate.parse(checkOut, formatter);
	      long days = DAYS.between(date1, date2);
	      int abc = (int)days;
	      
	      rvo.setDays(abc);
	      
	      
	      
	      
	      model.addAttribute("roomvo", rvo);
	      model.addAttribute("cList", hotelsrv.hotel_selectCategory());
	      
	      model.addAttribute("checkIn",checkIn);
	      model.addAttribute("checkOut",checkOut);
	      return "reservation";
	   }
	
	
	//예약정보 저장
	@RequestMapping(value = "/reservation_save", method = RequestMethod.GET)
		public String reservation_save(Model model, @ModelAttribute("")reservationVO resvo) throws Exception{
		      roomVO rvo = roomsrv.room_selectDetailAddr_roomNum(resvo.getDetailAddr_roomNum_res());
		      resvo.setCheckInDate(resvo.getCheckIn_res());
		      resvo.setCheckIn_res(resvo.getCheckIn_res()+"/"+rvo.getCheckIn_room());
		      resvo.setCheckOut_res(resvo.getCheckOut_res()+"/"+rvo.getCheckOut_room());
		      System.out.println(resvo.getPrice_res());
		      System.out.println(resvo.getId_res() + " / " + resvo.getDetailAddr_roomNum_res());
		      System.out.println(resvo.getCheckIn_res()+ " / " + resvo.getCheckOut_res());
		      
		      ressrv.reservation_save(resvo);
		      userVO uvo = usersrv.user_selectAll(resvo.getId_res()).get(0);
//		      model.addAttribute("uservo",uvo);
		      model.addAttribute("id_user",uvo.getId_user());
//		      model.addAttribute("resList", ressrv.reservation_selectID(uvo.getId_user()));
		      return "redirect:myPage";
		}
	
	//예약 취소
	@RequestMapping(value = "/reservation_delete", method = RequestMethod.GET)
	   public String reservation_delete(Locale locale, Model model, @RequestParam("detailAddr_roomNum_res")String detailAddr_roomNum_res,
			   @RequestParam("id_res")String id_res,
			   @RequestParam("checkInDate")String checkInDate) throws Exception {
		System.out.println(id_res);
		System.out.println(checkInDate);
		System.out.println(detailAddr_roomNum_res);
		
		HashMap<String,String> hmap = new HashMap<String,String>();
		hmap.put("detailAddr_roomNum_res",detailAddr_roomNum_res);
		hmap.put("id_res",id_res);
		hmap.put("checkInDate",checkInDate.split(" ")[0]);
		ressrv.reservation_delete(hmap);
		
		model.addAttribute("id_user", id_res);
		
		return "redirect:myPage";
	   }
	
	   
	
	   
}
