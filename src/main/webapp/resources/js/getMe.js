function getMe() {
    let obj = {'username': $('#loginUser').val()};
    $.ajax({
        url: '/getMe',
        type: 'POST',
        data: JSON.stringify(obj),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (data) {
            if(data != null){
                $('#fullName').val(data.fullname);
            }
        }
    });
}

//Загрузка
$(document).ready(function () {
    getMe();
});
