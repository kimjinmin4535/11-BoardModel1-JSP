<%@page import="kr.co.ezenac.model1.utils.JsFunction"%>
<%@page import="kr.co.ezenac.model1.board.BoardDAO"%>
<%@page import="kr.co.ezenac.model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./isLoggedIn.jsp"%>				

<%
		//수정내용 얻기
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("contet");
		
		//dto저장
		BoardDTO dto =new BoardDTO();
		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
		
		//db 반영
		BoardDAO dao =new BoardDAO(application);
		int affected = dao.updateEdit(dto);
		
		dao.close();
		
		//성공여부처리
		if (affected == 1){
			//덥데이트 성공시 살세뵈 해이지 이동
			response.sendRedirect("view.jsp?num="+dto.getNum());
		}
		else{
			JsFunction.alertBack("수정하기에 실패했습니다", out);
		}
%>