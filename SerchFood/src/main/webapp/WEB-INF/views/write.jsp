<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="board_write.sf" method="post">
	
	��¥<input type="text" id="date" name="date"></input><br>
	�ۼ���<input type="text" id="user" name="user" ></input><br>
	����<input type="text" id="title" name="title" placeholder="������ �Է����ּ���"></input><br>
	����<textarea name="content" id="contents" rows="4" cols="80" placeholder="������ �Է����ּ���"></textarea>

	<input type="submit" value="����ϱ�"></input>
	</form>









</body>
</html>