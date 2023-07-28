package com.hotel.reservation;

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
import com.hotel.VO.userVO;
import com.hotel.service.IF_HotelService;
import com.hotel.service.IF_ReservationService;
import com.hotel.service.IF_RoomService;
import com.hotel.service.IF_UserService;
import com.hotel.util.FileDataUtil;

@Controller
public class UserController {

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
	

	// 회원가입화면가기
	@RequestMapping(value = "/join_user", method = RequestMethod.GET)
	public String join_user(Locale locale, Model model) {

		return "join_user";
	}

	// 회원가입정보 저장
	@RequestMapping(value = "/join_user_save", method = RequestMethod.POST)
	public String join_user_save(Locale locale, Model model, @ModelAttribute("") userVO uvo) throws Exception {
		usersrv.join_user_save(uvo);

		return "home";
	}

	// 본인정보
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Locale locale, Model model, @RequestParam("id_user") String id_user) throws Exception {
		List<userVO> ulist = usersrv.user_selectAll(id_user);
		if (ulist.size() > 0) {
			model.addAttribute("uservo", ulist.get(0));
		}
		List<reservationVO>resList = ressrv.reservation_selectID(id_user);
		if(resList.size()>0) {
			for(reservationVO resvo : resList) {
				String a = resvo.getDetailAddr_roomNum_res();
				String b =hotelsrv.hotel_selectDetailAddr(a.split("/")[0]).getName_hotel();
				resvo.setHotelName(b+"/"+ resvo.getDetailAddr_roomNum_res().split("/")[1]);
				
			}
		}
		
		model.addAttribute("cList", hotelsrv.hotel_selectCategory());
		model.addAttribute("resList", resList);
		return "myPage";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/delete_user", method = RequestMethod.GET)
	public String delete_user(Locale locale, Model model, @RequestParam("id_user") String id_user) throws Exception {
		usersrv.delete_user(id_user);

		return "redirect:logout";
	}

	// 회원 정보 수정 폼 가기
	@RequestMapping(value = "/update_user", method = RequestMethod.GET)
	public String update_user(Locale locale, Model model, @RequestParam("id_user") String id_user) throws Exception {
		userVO uvo = usersrv.user_selectAll(id_user).get(0);
		model.addAttribute("uvo", uvo);

		return "update_user";
	}

	// 회원 정보 수정정보 저장
	@RequestMapping(value = "/update_user_save", method = RequestMethod.POST)
	public String update_user_save(Locale locale, Model model, @ModelAttribute("") userVO uvo) throws Exception {
		usersrv.update_user_save(uvo);
		model.addAttribute("id_user", uvo.getId_user());

		return "redirect:myPage";
	}
	// 비동기) 회원가입 아이디 중복체크
	@RequestMapping("/join_user_check.do")
	public @ResponseBody int priceCheck(HttpServletRequest request) throws Exception {
		String ID = request.getParameter("ID");
		List<userVO> uList = usersrv.user_selectAll(ID);
		if(uList.size()!=0) {
			return 0;
		}else {
			return 1;
		}
	}
	
}
