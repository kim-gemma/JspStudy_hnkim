<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxboard.AjaxDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ajaxboard.AjaxDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    AjaxDao dao=new AjaxDao();

    ArrayList<AjaxDto> list=dao.getAllBoard();
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
    
    //json라이브러리 이용해서 json데이타 생성하기
    JSONArray arr=new JSONArray();
    for(AjaxDto dto:list)
    {
    	JSONObject ob=new JSONObject();
    	
    	ob.put("num", dto.getNum());
    	ob.put("writer", dto.getWriter());
    	ob.put("subject", dto.getSubject());
    	ob.put("content", dto.getContent());
    	ob.put("avata", dto.getAvata());
    	ob.put("writeday", sdf.format(dto.getWriteday()));
    	
    	arr.add(ob);
    }
    	
  
%>

<%=arr.toString()%>