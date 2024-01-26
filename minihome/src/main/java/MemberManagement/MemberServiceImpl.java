package MemberManagement;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//dao를 통해 sql문을 실행한다.
//객체 이름:memberServiceImpl
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO dao;
	
	@Override
	public MemberDTO oneMember(String memberid) {
		return dao.oneMember(memberid);
	}
	
	@Override
	public String registerMember(MemberDTO dto) {
		MemberDTO selectdto = dao.oneMember(dto.getMemberid());
		if(selectdto !=null) {
			return "아이디 중복 - 회원 가입 불가";
		} else {
			dao.insertMember(dto);
			return "회원가입완료 - 환영합니다";
		}
		
	}

	@Override
	public int updateMember(MemberDTO dto) {
		return dao.updateMember(dto);
	}

	@Override
	public String deleteMember(MemberDTO dto) {
		MemberDTO selectdto = dao.oneMember(dto.getMemberid());
		
//		if(selectdto ==null) {
//			return "해당 회원이 존제하지 않습니다.";
//		} else {
			dao.deleteMember(dto);
			return "회원탈퇴완료";
//		}
	}



	
}
