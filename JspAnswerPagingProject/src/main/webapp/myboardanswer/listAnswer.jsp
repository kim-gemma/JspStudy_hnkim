<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.beans.SimpleBeanInfo"%>
<%@page import="myboard.BoardAnswerDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myboard.BoardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//이거 할때 json-simple-1.1.1.jar  라이브러리 넣어줘야해
	String num=request.getParameter("num");
	BoardAnswerDao dao= new BoardAnswerDao();

	List<BoardAnswerDto> list=dao.getAnswerList(num);
	
	
	JSONArray arr=new JSONArray();
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd hh:mm");
	for(BoardAnswerDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("idx",dto.getIdx());
		ob.put("num",dto.getNum());
		ob.put("nickname",dto.getNickname());
		ob.put("comment",dto.getComment());
		ob.put("writeday", sdf.format(dto.getWriteday()));
		
		arr.add(ob);
	}
%>
<%=arr.toString()%>