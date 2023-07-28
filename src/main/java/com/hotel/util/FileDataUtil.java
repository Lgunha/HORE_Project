package com.hotel.util;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class FileDataUtil {
	// 1. 컨트롤러가 받은첨부파일을 내가 원하는 곳에 (servlet_context uploadPath로 지정한 곳) 저장
	// 2. 파일을 유니크하게 재정의 함.
	
	@Resource(name="uploadPath")
	private String uploadPath;  // 소스를 안건드려,, 설정파일만 세팅할래,,
	//위의 코드와 같은 거지만 스프링에서는 설정파일만 셋팅해두기위해 위에 코드를 쓴다.
//	private String uploadPath="/tmp;"
	
	//mapping을 작성할 예정
	@RequestMapping(value="/download", method = RequestMethod.GET)
	@ResponseBody  //리턴타입이 view가 아니라 객체이다... json... 컨트롤러가 리턴을 view가 아닌 직접 데이터로 전송
	public FileSystemResource download(@RequestParam("filename")String filename, HttpServletResponse re) throws Exception{
		File file = new File(uploadPath+"/"+filename);
//		re.setContentType("application/download); utf-8");
//		re.setHeader("Content-disposition", "attachment; filename="+ filename);
		return new FileSystemResource(file);
	}
	
	
	
	public String[] fileUpload(MultipartFile[] file) throws Exception{
		// 1. 컨트롤러가 받은첨부파일을 내가 원하는 곳에 (servlet_context uploadPath로 지정한 곳) 저장
		// 2. 파일을 유니크하게 재정
		String[] saveName = new String[file.length]; 
		
		for(int i=0; i<file.length; i++) {
			
			if(file[i].getOriginalFilename()!="") {
				String orName =file[i].getOriginalFilename();
				UUID uid = UUID.randomUUID(); //랜덤문자
				
				saveName[i] = uid.toString()+"."+orName.split("\\.")[orName.split("\\.").length-1];  //확장자
				//파일명에는 "."이 들어가면 안됩니다.
				
				byte[] fileData = file[i].getBytes();  //첨부파일이 byte[]에 저장
				
				File target = new File(uploadPath, saveName[i]); // 폴더위치에 파일 생성
				FileCopyUtils.copy(fileData, target); //바이트 복사
				
				
			}
		}
		
		return saveName;
		
		// <수정> 복수개의 파일을 받으면 복수개의 파일을 저장하고 복수개의 파일의 이름을 리턴하도록 수정
	}
	
	
	
}
