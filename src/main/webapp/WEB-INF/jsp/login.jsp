<!doctype html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="./templates/header.jsp">
    <jsp:param name="title" value="Вход" />
    <jsp:param name="additionalCss" value="/resources/css/signin.css" />
</jsp:include>
<body>
<form method="POST" align="center" class="form-signin">
    <c:if test="${!empty param.accessDeny}"><center><font color="red">Доступ запрещен!</font></center></c:if>
    <c:if test="${!empty param.error}"><center><font color="red">Ошибка авторизации!</font></center></c:if>
    <c:if test="${!empty param.logout}"><center><font color="green">Успешный выход! Необходима авторизация!</font></center></c:if>
    <h1>Авторизация</h1>
    <label for="inputLogin" class="sr-only">Имя пользователя</label>
    <input type="text" name="username" id="inputLogin" class="form-control" placeholder="Введите имя" required autofocus/>
    <label for="inputPassword" class="sr-only">Пароль</label>
    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Пароль" required/>
    <input class="btn btn-lg btn-primary btn-block" type="submit" value="Войти" />
</form>
<jsp:include page="./templates/footer.jsp" />
</body>
</html>
