package MemberManagement;




//dao를 통해 sql문을 실행한다.
public interface MemberService {
	//member 검색
	MemberDTO oneMember(String memberid);
	//member 등록
	String registerMember(MemberDTO dto);
	//member 수정
	int updateMember(MemberDTO dto);
	//member 삭제
	String deleteMember(MemberDTO dto);
}
