<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <div class="list-group">
            <c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}" scope="request" />
            <sec:authorize access="hasRole('ADMIN')">
            <a  href="/admin" class="list-group-item list-group-item-action <c:if test="${fn:contains(uri,'/admin')}">active</c:if>">Администрирование</a>
            </sec:authorize>
            <a href="/user" class="list-group-item list-group-item-action <c:if test="${fn:contains(uri,'/user')}">active</c:if>">Раздел для пользователя</a>
        </div>
    </div>
</nav>