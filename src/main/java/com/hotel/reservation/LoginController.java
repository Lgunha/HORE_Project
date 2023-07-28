package com.hotel.reservation;

import static java.time.temporal.ChronoUnit.DAYS;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.VO.reservationVO;
import com.hotel.VO.roomVO;
import com.hotel.VO.userVO;
import com.hotel.service.IF_UserService;

@Controller
public class LoginController {
	@Inject
	IF_UserService usersrv;
	
	//로그인 기능
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Locale locale, Model model, HttpSession session,
			@RequestParam("id_user") String id_user) throws Exception{
		
		if(!id_user.equals("비회원")) {
			userVO uvo = usersrv.user_selectAll(id_user).get(0);
			session.setAttribute("nowUser", id_user);
			session.setAttribute("UserType", uvo.getType_user());
		}else {
			session.setAttribute("nowUser", "비회원");
		}
		
		
		return "redirect:mainPage";
	}
	//로그아웃 기능
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String login(Locale locale, Model model, HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:home";
	}
	
	// 비동기)로그인 체크
	@RequestMapping("/LoginCheck.do")
	public @ResponseBody int priceCheck(HttpServletRequest request) throws Exception {
		String ID = request.getParameter("ID");
		String  pw= request.getParameter("pw");
		List<userVO> ulist = usersrv.user_selectAll(null);
		System.out.println(1);
		System.out.println(ID);
		boolean flag = true;
		String type_user = null;
		for(int i=0; i<ulist.size(); i++) {
			if(ulist.get(i).getId_user().equals(ID) && ulist.get(i).getPw_user().equals(pw)) {
				flag=false;
				type_user = ulist.get(i).getType_user();
				break;
			}
		}
		
		if(!flag) {
			return 1;
		}else {
			return 0;
		}
		

	}
}
