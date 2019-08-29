//var URL_PREF = '/ex';
var URL_PREF = '';

$(document).ready(function(){
    refreshUserTable();

    $('#usersList').on('click', '.btnDel', deleteUserHandler);

    $('#usersList').on('click', '.btnEdit',  showEditModalWindow);

    $('.tab-content').on('click', '.btnAddUser', {'container':'div#nav-profile', 'propSuf':'', 'method':'POST'}, saveUserHandler);


});

function refreshUserTable(){
    $.getJSON("/ajax/users",function(data){
        $('#usersList').text('');
        $.each(data , function(index, user){
                var row = $('<tr />').attr('align', 'center');
                row.append($('<td />').text(user.id));
                row.append($('<td />').text(user.userRole == null ? '':user.userRole.roleName));
                row.append($('<td />').text(user.name));
                row.append($('<td />').text(user.password));
                row.append($('<td />').text(user.login));
                var btnDel = $('<a />').addClass('btn btn-primary btnDel').attr('href', '/ajax/users?id='+user.id)
                    .attr('title', 'Удалить').text('X');
                var btnEdit = $('<a />').addClass('btn btn-primary btnEdit').attr('href', '/ajax/users?id='+user.id)
                    .attr('title', 'Редактировать').text('...');
                row.append($('<td />').append(btnDel).append(' ').append(btnEdit));
                $('#usersList').append(row);
        });

    });
}

function deleteUserHandler(event){
    event.preventDefault();
    var href = $(this).attr('href');

    $.ajax({
        url: URL_PREF + href,
        type: 'DELETE',
        success: function(result) {
            refreshUserTable();
        }
    });

}

function saveUserHandler(event){
    event.preventDefault();
    var container = event.data.container;
    var propSuf = event.data.propSuf;

    var userObject = {};
    if($(container + ' #inputHiddenId').length > 0){
        userObject.id = $(container + ' #inputHiddenId').val();
    }
    userObject.name = $(container + ' #inputName'+ propSuf).val();
    userObject.login = $(container + ' #inputLogin'+propSuf).val();
    userObject.password = $(container + ' #inputPassword'+propSuf).val();
    userObject.userRole = {'id':$(container + ' #selectRole'+propSuf).val()}


    $.ajax({
        url: URL_PREF + '/ajax/users',
        type: event.data.method,
        data: JSON.stringify(userObject),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function(res) {
            refreshUserTable();
        }
    });
    if(container == '.modal'){
        $('#userEditFormModal').modal('hide');
    }
    if(container == 'div#nav-profile'){
        $('.nav-tabs #nav-home-tab').tab('show');
        $(container + ' input').val('');
        $(container + ' select').prop('selectedIndex',0);
    }
}

function showEditModalWindow(event){
    event.preventDefault();
    var href = $(this).attr('href');

    $.get(URL_PREF + href,function (user, status) {
        $('.modal #inputIdModal').val(user.id);
        $('.modal #inputHiddenId').val(user.id);
        $('.modal #inputNameModal').val(user.name);
        $('.modal #inputLoginModal').val(user.login);
        $('.modal #inputPasswordModal').val(user.password);
        $('.modal #selectRoleModal').val(user.userRole.id);
    });

    $('.modal').on('click', '.btnEditUser', {'container':'.modal', 'propSuf':'Modal', 'method':'PUT'}, saveUserHandler);

    $('#userEditFormModal').modal();
}