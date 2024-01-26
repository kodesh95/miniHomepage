package MemberManagement;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class MemberController {
	@Autowired
	MemberService service;
	
	//login화면으로 이동
	@GetMapping("/MemberManagement/login")
	String login() {
		return "MemberManagement/login";
	}
	//마이페이지로 이동
	@PostMapping("/MemberManagement/mypage")
	ModelAndView toMyPage(MemberDTO dto, HttpSession session) {
//		System.out.println(session.getAttribute("oneMember"));
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("oneMember", dto); //update와 login session name 같도록
		mv.setViewName("/MemberManagement/mypage");
		return mv;
	}
	
	//마이페이지에서 회원정보 수정 시 홈화면으로 이동
	@PostMapping("/MemberManagement/homelogin")
	ModelAndView updateMember(MemberDTO dto, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
			
			
			service.updateMember(dto);
			
			MemberDTO updatedDto = service.oneMember(dto.getMemberid());
			session.setAttribute("oneMember", updatedDto);
			mv.setViewName("/MemberManagement/homelogin");
		
		return mv;
	}
	
	//마이페이지에서 회원정보 취소 시 홈화면 이동
	@PostMapping("/cancelUpdate")
	String cancelUpdate() {
		
		return "/MemberManagement/homelogin";
	}
	
	

	//회원가입화면으로 이동
	@GetMapping("/MemberManagement/join")
	String join() {
		return "MemberManagement/join";
	}

	@PostMapping("/MemberManagement/joinResult")
	ModelAndView joinProcess(MemberDTO dto,HttpSession session) {
		String result = service.registerMember(dto);
		ModelAndView mv= new ModelAndView();
		
		if (result.equals("아이디 중복 - 회원 가입 불가")) {
			mv.addObject("result", result);
			mv.setViewName("MemberManagement/join");
		} else {
			session.setAttribute("oneMember", dto);
			mv.addObject("result", result);
			mv.setViewName("home/homelogin");
		}
		return mv;
	}
	
	
}
