package join;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String nickName;
	private String email;
	private String route;
	private String homePhone;
	private String phone;
	private Date birthday;
	private String postNum;
	private String address;
	private boolean kakaoMessage;
	private boolean mailing;
	private boolean smsReceiving;
	private boolean infoOpen;
	
	public MemberVO() {
		System.out.println("MemberVO 생성자 호출");
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getHomePhone() {
		return homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isKakaoMessage() {
		return kakaoMessage;
	}

	public void setKakaoMessage(boolean kakaoMessage) {
		this.kakaoMessage = kakaoMessage;
	}

	public boolean isMailing() {
		return mailing;
	}

	public void setMailing(boolean mailing) {
		this.mailing = mailing;
	}

	public boolean isSmsReceiving() {
		return smsReceiving;
	}

	public void setSmsReceiving(boolean smsReceiving) {
		this.smsReceiving = smsReceiving;
	}

	public boolean isInfoOpen() {
		return infoOpen;
	}

	public void setInfoOpen(boolean infoOpen) {
		this.infoOpen = infoOpen;
	}
}
