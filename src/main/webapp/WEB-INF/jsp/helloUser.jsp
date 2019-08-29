<!doctype html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="./templates/header.jsp">
    <jsp:param name="title" value="Привет!" />
    <jsp:param name="additionalCss" value="/resources/css/dashboard.css" />
</jsp:include>
<body>
<jsp:include page="./templates/topNav.jsp" />
<div class="container-fluid">
    <div class="row">
        <jsp:include page="./templates/leftNav.jsp" />
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <h1 class="h2">Страница пользователя</h1>
            <c:if test="${!empty user}">Привет, ${user.name}</c:if><br />
        </main>
    </div>
</div>
<jsp:include page="./templates/footer.jsp" />
</body>
</html>
