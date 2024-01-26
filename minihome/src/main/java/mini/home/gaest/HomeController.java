package mini.home.gaest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import MemberManagement.MemberDTO;
import MemberManagement.MemberService;

@Controller
public class HomeController {

	@Autowired
	MemberService service;

	//첫 화면 + 로그인된 상태에서 홈화면
	@RequestMapping("/")
	String showHome(HttpSession session){
		if(session.getAttribute("oneMember") != null) {
				return "home/homelogin";
		}
		return "home/home";
	}
	
//	//회원탈퇴
//	@PostMapping("/secession")
//	String deleteMember(HttpSession session) throws Exception{
//		MemberDTO dto = (MemberDTO)session.getAttribute("oneMember");
//		// 아이디 변경
//		System.out.println(dto);
//		// session 제거
//		session.removeAttribute("oneMember");
//		System.out.println(session.getAttribute("oneMember"));
//		// id 수정
//		service.deleteMember(dto);
//		System.out.println(dto);
//		
//		return "home/home";
//	}
	
	
	// 에러 처리
	@ExceptionHandler(Exception.class) 
	public String errorHandle(Exception ex) {
		return "error";
	}
	
	//로그아웃 작업
	@PostMapping("/logout")
	String logout(HttpSession session){
		if(session.getAttribute("oneMember") != null) {
		session.removeAttribute("oneMember");
	}
		return "home/home";
	}

	//로그인된 상태에서 홈화면
  @PostMapping("/homelogin")
	String homelogin(HttpSession session) {
		return "home/homelogin";
	}

  //프로필로 이동
  @PostMapping("/profile")
	String profile(HttpSession session) {
		return "home/profile";
	}
  //일기장으로 이동	
  @PostMapping("/diary")
  String diary(HttpSession session) {
  	return "home/diary";
  }
  //방명록으로 이동
  @PostMapping("/guest")
	String guest(HttpSession session) {
		return "home/guest";
	}
  //로그인 작업
	@PostMapping("/home/homelogin")
	ModelAndView loginProess(String memberid, String pw, HttpSession session) {
		MemberDTO dto = service.oneMember(memberid);
		ModelAndView mv = new ModelAndView();
		if (session.isNew()) {
			if (dto == null) {
				mv.addObject("result", "회원가입을 해주세요");
				mv.setViewName("home/home");
				return mv;
			} else {
				if (!dto.getPw().equals(pw)) {
					mv.addObject("result", "비밀번호를 다시 입력해주세요");
					mv.setViewName("MemberManagement/login");
					return mv;
				} else {
					session.setAttribute("oneMember", dto);
					mv.setViewName("home/homelogin");
					return mv;
				}
			}
		} else {
			dto = service.oneMember(memberid);
			
			if(dto==null) {
				mv.addObject("result", "회원가입을 해주세요");
				mv.setViewName("home/home");
				return mv;
			} else {
				if (!dto.getPw().equals(pw)) {
					mv.addObject("result", "비밀번호를 다시 입력해주세요");
					mv.setViewName("MemberManagement/login");
					return mv;
				} else {
					
					session.setAttribute("oneMember", dto);
					mv.setViewName("home/homelogin");
					return mv;
				}
			}
		}
	}//loginPrcess
	
}
