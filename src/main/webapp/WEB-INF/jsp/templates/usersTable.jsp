<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${!empty users}">
    <table class="table table-hover">
    <thead>
    <tr align="center">
        <th>ID</th>
        <th>Роль</th>
        <th>Имя</th>
        <th>Пароль</th>
        <th>Логин</th>
        <th>Изменить</th>
    </tr>
    </thead>
    <tbody id="usersList">
    </tbody>
    </table>
</c:if>