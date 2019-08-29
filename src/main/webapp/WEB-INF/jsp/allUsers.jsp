<!doctype html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="./templates/header.jsp">
    <jsp:param name="title" value="Все пользователи" />
    <jsp:param name="additionalCss" value="/resources/css/dashboard.css" />
</jsp:include>
<body>
<jsp:include page="./templates/topNav.jsp" />
<div class="container-fluid">
    <div class="row">
        <jsp:include page="./templates/leftNav.jsp" />
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <h1 class="h2">Администрирование</h1>
            <c:if test="${!empty param.deleteOk}"><font color="red">Пользователь удален!</font></c:if>
            <c:if test="${!empty param.deleteNotOk}"><font color="red">Неудача при попытке удалить пользователя!</font></c:if>
            <c:if test="${!empty param.updateNotOk}"><font color="red">Неудача при попытке редактировать пользователя!</font></c:if>
            <c:if test="${!empty param.updateOk}"><font color="green">Пользователь сохранен!</font></c:if>
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Таблица пользователей</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Новый пользователь</a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <jsp:include page="./templates/usersTable.jsp" />
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <jsp:include page="./templates/userForm.jsp" />
                </div>
            </div>
        </main>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="userEditFormModal" tabindex="-1" role="dialog" aria-labelledby="userEditFormModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userEditFormModalTitle">Редактирование пользователя</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <jsp:include page="./templates/userForm.jsp">
                    <jsp:param name="isModalType" value="1" />
                </jsp:include>
            </div>

        </div>
    </div>
</div>
<jsp:include page="./templates/footer.jsp" />
</body>
</html>