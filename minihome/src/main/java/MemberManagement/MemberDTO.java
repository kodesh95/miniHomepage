package MemberManagement;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {

	@Override
	public String toString() {
		return "MemberDTO [memberid=" + memberid + ", pw=" + pw + ", membername=" + membername + ", phone=" + phone
				+ ", email=" + email + ", birthday=" + birthday + ", gender=" + gender + "]";
	}

	String memberid;
	String pw;
	String membername;
	String phone;
	String email;
	String birthday;
	String gender;

	public MemberDTO(String memberid, String pw, String membername, String phone, String email, String birthday,
			String gender) {
		super();
		this.memberid = memberid;
		this.pw = pw;
		this.membername = membername;
		this.phone = phone;
		this.email = email;
		this.birthday = birthday;
		this.gender = gender;
	}

	
	public MemberDTO() {
		super();
	}
	
	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
