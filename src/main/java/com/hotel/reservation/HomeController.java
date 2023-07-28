package com.hotel.reservation;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.hotel.VO.hotelVO;
import com.hotel.service.IF_HotelService;
import com.hotel.service.IF_ReservationService;
import com.hotel.service.IF_RoomService;
import com.hotel.service.IF_UserService;
import com.hotel.util.FileDataUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
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
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model)throws Exception {
		ressrv.reservation_autoDelete();
		return "home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homego(Locale locale, Model model)throws Exception {
		ressrv.reservation_autoDelete();
		return "home";
	}

	//메인 화면 가기
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String mainPage(Model model,HttpSession session) throws Exception {
		model.addAttribute("cList",hotelsrv.hotel_selectCategory());
		
		String url = "http://127.0.0.1:5000/tospring";
		String sb = "";
		String[] chuchun = new String[3];
		String ab = (String) session.getAttribute("nowUser");
		String message = ab; // 전송할 값
		System.out.println(ab);
		RestTemplate restTemplate = new RestTemplate();
		
		// 요청 헤더 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		// 전송할 데이터 설정
		HttpEntity<String> requestEntity = new HttpEntity<>(message, headers);
		System.out.println(1);
		// POST 요청 보내기
		if(ab !="비회원") {
			ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);
			System.out.println(2);
			if (response.getStatusCode().is2xxSuccessful()) {
				String responseBody = response.getBody();
				if(responseBody !=null) {
					chuchun=responseBody.split("/");
					System.out.println(responseBody);
				}
			} else {
				System.out.println("Request failed with status: " + response.getStatusCode());
			}
			
			if(chuchun[0]!=null) {
				List<hotelVO> hList = new ArrayList<hotelVO>();
				for(int i = 0 ; i < chuchun.length;i++) {
					hList.add(hotelsrv.hotel_selectBigAddr(chuchun[i]).get(0));
				}
				model.addAttribute("chuchunList", hList);
				
			}
		}
		
		
		
		return "mainPage";
	}
	
	
}
