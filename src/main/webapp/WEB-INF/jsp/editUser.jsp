<!doctype html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="./templates/header.jsp">
    <jsp:param name="title" value="Добавление/редактирование пользователя" />
</jsp:include>
<body>
<ol>
<li><a href="/admin/editUser">Добавить пользователя</a></li>
<li><a href="/">Все пользователи</a></li>
<li><a href="/logout"><b>Выйти</b></a></li>
</ol>
${message}
<h3>Добавление/редактирование пользователя</h3>
<jsp:include page="./templates/userForm.jsp" />
<jsp:include page="./templates/footer.jsp" />
</body>
</html>