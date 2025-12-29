<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="guest.GuestDto"%>
<%@page import="guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//전체 흐름 정리
//DB
//↓
//DAO → List<GuestDto>
//↓
//JSP에서 JSONObject / JSONArray로 변환
//↓
//arr.toString() → JSON 문자열
//↓
//AJAX가 받아서 화면을 그림
//!! 위 화면은 jsp는 보여주는 페이지가 아니라 "데이터를 만들어서 넘겨주는 페이지!!!"
%>

<%
  // 이회면은 AJAX에게 JSON 데이터만 돌려주는 “데이터용 JSP”다
  //DB에 있는 방명록 여러 줄(row) 을자바 객체로 바꿔서List<GuestDto> 로 가져온 것 이 상태는 자바 세상 아직 JSON 아님
  //왜 JSON으로 바꿔야 하냐 (핵심)❗ AJAX / JavaScript는 GuestDto, List 같은 자바 객체를 절대 이해 못 함
 //그래서 반드시 JSON으로 바꿔야 함
//❌ List<GuestDto> 그대로 보내기 → 불가능
//⭕ JSON 문자열로 보내기 → 가능
	GuestDao dao= new GuestDao();
	List<GuestDto> list=dao.getAllGuest();
	
	JSONArray arr=new JSONArray();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	for(GuestDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("num", dto.getNum());
		ob.put("nick", dto.getNickname());
		ob.put("content", dto.getContent());
		ob.put("emot", dto.getEmot());
		ob.put("writeday", sdf.format(dto.getWriteday()));
		
		//arr추가
		arr.add(ob);
	}
	  //반드시 json화 해서 저장 ?? json형태로 보여지는거 해야되 모든 데이터 하나의 데이터 가지고 올수없다면 여기를 먼저해결 dao로 한거는 보여줘야돼??
%>
<%=arr.toString()%>
<%
//자바            | JSON       |
//------------- | ---------- |
//GuestDto 하나   | JSONObject |
//GuestDto 여러 개 | JSONArray  |

%>