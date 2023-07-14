<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ファイルアップロード</title>
</head>
<body>
	<%--適宜，パスを変更してください--%>
<form method="POST" enctype="multipart/form-data"action="/2022g15/upload/UploadServlet">
<input type="file" name="file"/><br />
<input type="submit" value="アップロード" />
</form>
</body>
</html>