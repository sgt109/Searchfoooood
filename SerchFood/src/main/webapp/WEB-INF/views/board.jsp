<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��Ǹ��</title>

</head>
<body>
	<div align="center">
		<h1>�Խù� ����Ʈ</h1>
		<p>
		<table border="1">
			<tr align="center">
				<th>��ȣ</th>
				<th>��¥</th>
				<th>�ۼ���</th>
				<th>����</th>
				<th>����</th>
			
			</tr>
			<c:forEach var="board_list" items="${board_list}">
				<tr align="center">
					<td>${board_list.seq}</td>
					<td>${board_list.date_auto}</td>
					<td>${board_list.user_auto}</td>
					<td>${board_list.title}</td>
					<td>${board_list.contents}</td>
				<tr>
			</c:forEach>
		</table>
		</p>
	</div>
<input type="button" name="boardwrite" id="boardwrite" value="�۾���" Onclick="location.href='board_form.bo'"></input>
</body>
</html>