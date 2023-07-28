package com.hotel.reservation;

import static java.time.temporal.ChronoUnit.DAYS;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.VO.characterVO;
import com.hotel.VO.hotelVO;
import com.hotel.VO.reservationVO;
import com.hotel.VO.roomVO;
import com.hotel.dao.IF_ChaDAO;
import com.hotel.service.ChaServiceImpl;
import com.hotel.service.IF_ChaService;
import com.hotel.service.IF_HotelService;
import com.hotel.service.IF_ReservationService;
import com.hotel.service.IF_RoomService;
import com.hotel.service.IF_UserService;
import com.hotel.util.FileDataUtil;

@Controller
public class HotelController {
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
	@Inject
	IF_ChaService chasrv;
	
	
	// 숙소등록 화면가기
	@RequestMapping(value = "/join_hotel", method = RequestMethod.GET)
	public String join_hotel(Locale locale, Model model) {
		return "join_hotel";
	}

	// 숙소등록 정보 저장
	@RequestMapping(value = "/join_hotel_save", method = RequestMethod.POST)
	public String join_hotel_save(Locale locale, Model model, @ModelAttribute("") hotelVO hvo, MultipartFile[] file)
			throws Exception {
		//hvo의 character는 배열로 온다.. 이것을 chacterVO타입의 객체에 하나씩 set을 해서 DB에 저장해야한다.
		List<characterVO> chaList = new ArrayList<characterVO>();
		for(int i=0; i<hvo.getCharacter().length; i++) {
			characterVO cvo = new characterVO();
			cvo.setDetailAddr_hotel_character(hvo.getDetailAddr_hotel());
			cvo.setCharacter(hvo.getCharacter()[i]);
			chaList.add(cvo);
		}
		
		String[] newName = filedatautil.fileUpload(file);
		String mainImg = newName[0];
		hvo.setImg_hotel(mainImg);
		hotelsrv.join_hotel_save(hvo,chaList);
		return "redirect:mainPage";
	}

	// 숙소 리스트 보기
	@RequestMapping(value = "/list_hotel", method = RequestMethod.GET)
	public String list_hotel(Locale locale, Model model, @RequestParam("category_hotel") String category)
			throws Exception {
		List<hotelVO> hlist = hotelsrv.hotel_selectAll(category);
//		System.out.println(hlist.get(0).getImg_hotel());
		model.addAttribute("cList", hotelsrv.hotel_selectCategory());
		model.addAttribute("hotelList", hlist);
		model.addAttribute("cate", category);

		return "list_hotel";
	}

	// 숙소 자세히  보기 
	@RequestMapping(value = "/detail_hotel", method = RequestMethod.GET)
	public String detail_hotel(Locale locale, Model model, @RequestParam("detailAddr_hotel") String detailAddr_hotel,
			@RequestParam("id_hotel") String id_hotel,HttpSession session) throws Exception {
		LocalDate sysdate = LocalDate.now();
	    sysdate = sysdate.plusDays(1);	//입실가능날짜 최소
	    LocalDate sysdatePlus = sysdate.plusDays(1); // 퇴실가능날짜 최소
	     
	    //호텔 특징 가져와서 로그인된 유저의 특징테이블 카운팅해야함
	    List<String> chaList_String = chasrv.select_cha_hotel(detailAddr_hotel);
	   
	    List<characterVO> chaList = new ArrayList<characterVO>();
	    for(int i=0; i<chaList_String.size(); i++) {
	    	System.out.println(chaList_String.get(i));
			characterVO cvo = new characterVO();
			cvo.setId_user_character((String)session.getAttribute("nowUser"));
			cvo.setCharacter(chaList_String.get(i));
			chaList.add(cvo);
		}
	    chasrv.insert_count(chaList);
	    model.addAttribute("sysdate",sysdate);
	    model.addAttribute("sysdatePlus",sysdatePlus);
		model.addAttribute("detailAddr_hotel", detailAddr_hotel);
		model.addAttribute("id_hotel", id_hotel);
		model.addAttribute("hotelvo", hotelsrv.hotel_selectDetailAddr(detailAddr_hotel));
//		System.out.println(hotelsrv.hotel_selectDetailAddr(detailAddr_hotel).getDetailAddr_hotel());
		model.addAttribute("roomList", roomsrv.room_selectDetailAddr(detailAddr_hotel));
		model.addAttribute("cList", hotelsrv.hotel_selectCategory());

		return "detail_hotel";
	}

	// 숙소 제목으로 검색
	@RequestMapping(value = "/search_hotel", method = RequestMethod.POST)
	public String search_hotel(Locale locale, Model model, @RequestParam("search_category_hotel") String cate,
			@RequestParam("search_name_hotel") String search) throws Exception {
		System.out.println(search);
		System.out.println(cate);
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("search_category", cate);
		hmap.put("search_name", search);
		List<hotelVO> hotelList = hotelsrv.search_hotel(hmap);
		model.addAttribute("cList", hotelsrv.hotel_selectCategory());
		model.addAttribute("hotelList", hotelList);
		model.addAttribute("cate", cate);

		return "list_hotel";
	}

	// 내 숙소 리스트 보기
	@RequestMapping(value = "/myHotel", method = RequestMethod.GET)
	public String myHotel(Locale locale, Model model, @RequestParam("id_user") String id_user) throws Exception {
		List<hotelVO> hlist = hotelsrv.hotel_select_my(id_user);

		model.addAttribute("cList", hotelsrv.hotel_selectCategory());
		model.addAttribute("hotelList", hlist);

		return "list_hotel";
	}

	// 숙소 정보 수정 폼 가기
	@RequestMapping(value = "/update_hotel", method = RequestMethod.GET)
	public String update_hotel(Locale locale, Model model, @RequestParam("detailAddr_hotel") String detailAddr_hotel)
			throws Exception {

		model.addAttribute("hvo", hotelsrv.hotel_selectDetailAddr(detailAddr_hotel));

		return "update_hotel";
	}

	// 숙소 정보 수정정보 저장
	@RequestMapping(value = "/update_hotel_save", method = RequestMethod.POST)
	public String update_hotel_save(Locale locale, Model model, @ModelAttribute("") hotelVO hvo, MultipartFile[] file)
			throws Exception {
		String[] newName = filedatautil.fileUpload(file);
		String mainImg = newName[0];

		hvo.setImg_hotel(mainImg);
		hotelsrv.update_hotel_save(hvo);

		model.addAttribute("detailAddr_hotel", hvo.getDetailAddr_hotel());
		model.addAttribute("id_hotel", hvo.getId_hotel());

		return "redirect:detail_hotel";
	}

	// 숙소 삭제
	@RequestMapping(value = "/delete_hotel", method = RequestMethod.GET)
	public String delete_hotel(Locale locale, Model model, @RequestParam("detailAddr_hotel") String detailAddr_hotel,
			HttpSession session) throws Exception {
		hotelsrv.delete_hotel(detailAddr_hotel);
		List<hotelVO> hlist = hotelsrv.hotel_select_my((String) session.getAttribute("nowUser"));

		model.addAttribute("cList", hotelsrv.hotel_selectCategory());
		model.addAttribute("hotelList", hlist);

		return "list_hotel";
	}

	// 비동기)가격 곱해지기 + 예약가능한 방 보여주기
	@RequestMapping("/CheckDate.do")
	public @ResponseBody List<roomVO> priceCheck(HttpServletRequest request) throws Exception {
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String detailAddr = request.getParameter("detailAddr");
//		System.out.println(checkIn + "/" + checkOut + "/" + detailAddr);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date1 = LocalDate.parse(checkIn, formatter);
		LocalDate date2 = LocalDate.parse(checkOut, formatter);
		List<roomVO> roomList = roomsrv.room_selectDetailAddr(detailAddr);
		List<reservationVO> resList = ressrv.reservation_selectDetailAddr(detailAddr);
		if (resList.size() > 0) {
			// System.out.println(resList.get(0).getDetailAddr_roomNum_res());
			List<String> a = new ArrayList<String>();
			for (reservationVO resvo : resList) {
				if (resvo.getCheckIn_res().compareTo(checkOut) >= 0
						|| resvo.getCheckOut_res().compareTo(checkIn) <= 0) {
//					System.out.println("예약가능");
				} else {
					a.add(resvo.getDetailAddr_roomNum_res());
				}
			}
			System.out.println(3);
			for (int i = 0; i < a.size(); i++) {
				for (int j = 0; j < roomList.size(); j++) {
					if (a.get(i).equals(roomList.get(j).getDetailAddr_roomNum_room())) {
						roomList.remove(j);
						break;
					}
				}
			}
			
		}

		long days = DAYS.between(date1, date2);
		int abc = (int) days;
		for (roomVO rvo : roomList) {
			rvo.setDays(abc);
		}
		return roomList;

	}

}
