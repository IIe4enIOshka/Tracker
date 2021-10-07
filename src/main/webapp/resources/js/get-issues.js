//Загрузка
$(document).ready(function () {
    $.ajax({
        type: 'get',
        url: '/get_issues',
        dataType: 'json',
        success: function (data) {
            var arr = data;

            if (arr.length > 0) {
                $('.body').html("");
            }

            $.each(arr, function (index) {
                $('.body').append(
                    '<div class="row">' +
                    '<div class="col-md-6">' +
                    '<a href="/commentsPage?id=' + data[index].id + '">' + data[index].name + '</a>' +
                    '</div>' +
                    '<div class="col-md-2">' + data[index].status + '</div>' +
                    '<div class="col-md-4">' + data[index].start_date + '</div>' +
                    '</div>'
                );
            });
        }
    });
});