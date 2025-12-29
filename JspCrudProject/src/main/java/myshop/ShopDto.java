package myshop;

import java.sql.Timestamp;

/*
 * ShopDto
 * - myshop 테이블의 한 행(row)을 담기 위한 데이터 전송 객체(DTO)
 * - JSP ↔ DAO ↔ DB 사이에서 데이터를 안전하게 전달하는 역할
 */

public class ShopDto {
	   /*
     * num
     * - myshop 테이블의 기본키(PK)
     * - DB에서는 INT AUTO_INCREMENT 타입이지만
     * - ***JSP/DAO에서 파라미터 처리(getParameter)와 바인딩이 편리하도록 String으로 선언!!
     */
	private String num;
	private String sangpum;
	private String photo;
	private int price;
	private String ipgoday;
	private Timestamp writeday;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getSangpum() {
		return sangpum;
	}
	public void setSangpum(String sangpum) {
		this.sangpum = sangpum;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getIpgoday() {
		return ipgoday;
	}
	public void setIpgoday(String ipgoday) {
		this.ipgoday = ipgoday;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
}
