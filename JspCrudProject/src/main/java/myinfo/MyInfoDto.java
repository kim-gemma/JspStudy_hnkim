package myinfo;

import java.sql.Timestamp;

//에러나면 이거 삭제하고 다시 연결해보기 클래스 못찾는 부분 다시 지우고 만들기
public class MyInfoDto {
	private String num;
	private String name;
	private String addr;
	private Timestamp sdate;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Timestamp getSdate() {
		return sdate;
	}
	public void setSdate(Timestamp sdate) {
		this.sdate = sdate;
	}

}
