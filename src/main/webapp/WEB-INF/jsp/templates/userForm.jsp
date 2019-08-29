<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="POST" action="/admin/editUser">
    <c:set var="formWidthClass" value="col-lg-4" scope="request"/>
    <c:set var="formModalSuffix" value="" scope="request"/>
    <c:if test="${!empty param.isModalType}">
        <c:set var="formWidthClass" value="col-lg-8" scope="request"/>
        <c:set var="formModalSuffix" value="Modal" scope="request"/>
    </c:if>
    <div class="form-group ${formWidthClass}" style="margin: 0 auto;">
    <c:if test="${!empty editUser.id}">
        <input type="hidden" name="id" value="${editUser.id}">
    </c:if>
<c:if test="${!empty param.isModalType}">
        <div class="form-group" id="inputIdDiv">
            <label for="inputId${formModalSuffix}">ID</label>
            <input type="text" class="form-control" id="inputId${formModalSuffix}" disabled  value="" />
            <input type="hidden" id="inputHiddenId" name="id" value="">
        </div>
</c:if>
        <div class="form-group">
            <label for="inputName${formModalSuffix}">Имя пользователя</label>
            <input type="text" class="form-control" id="inputName${formModalSuffix}" placeholder="Имя" name="name" value="${editUser.name}" />
        </div>
        <div class="form-group">
            <label for="selectRole${formModalSuffix}">Роль</label>
            <c:if test="${!empty userRoles}">
                <select name="role_id" id="selectRole${formModalSuffix}" class="form-control">
                    <c:forEach items="${userRoles}" var="userRole">
                        <option value="${userRole.id}" <c:if test="${!empty editUser && !empty editUser.userRole && editUser.userRole.id == userRole.id}">selected="selected"</c:if>>${userRole.roleName}</option>
                    </c:forEach>
                </select>
            </c:if>
        </div>
        <div class="form-group">
            <label for="inputLogin${formModalSuffix}">Логин</label>
            <input type="text" class="form-control" id="inputLogin${formModalSuffix}" placeholder="Логин" name="login" value="${editUser.login}" />
        </div>
        <div class="form-group">
            <label for="inputPassword${formModalSuffix}">Пароль</label>
            <input type="password" class="form-control" id="inputPassword${formModalSuffix}" placeholder="Пароль" name="password" value="${editUser.password}" />
        </div>
        <c:if test="${empty param.isModalType}">
        <div class="col-md-4 m-auto">
            <a href="" class="btn btn-primary btnAddUser">Сохранить</a>
        </div>
        </c:if>
        <c:if test="${!empty param.isModalType}">
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
            <a href="" class="btn btn-primary btnEditUser">Сохранить</a>
        </div>
        </c:if>
    </div>
</form>
