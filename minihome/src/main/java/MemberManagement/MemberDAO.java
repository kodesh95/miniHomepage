package MemberManagement;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// service로 부터 data를 받아서 sql문을 실행한다.
@Repository
public class MemberDAO {
 
	@Autowired
	SqlSession session;

	MemberDTO oneMember(String memberid){
		return session.selectOne("oneMember", memberid);
	}
	
	int insertMember(MemberDTO dto){
		return session.insert("insertMemberDTO", dto );
	}
	
	int updateMember(MemberDTO dto){
		return session.update("updateMember", dto );
	}
	int deleteMember(MemberDTO dto) {
		return session.update("deleteMember",dto);
	}

}
