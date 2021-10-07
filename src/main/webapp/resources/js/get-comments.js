//Загрузка
$(document).ready(function () {
    getComments();
});

function getComments() {
    var _id = getUrlParameter('id');

    let obj = {
        id: _id
    };

    $.ajax({
        type: 'POST',
        url: '/get_comments',
        data: JSON.stringify(obj),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (data) {
            var arr = data;

            if (arr.length > 0) {
                $('.body__comments__text').html("");
            }

            $.each(arr, function (index) {
                $('.body__comments__text').append(
                    '<div class="row">' +
                    '<p>Update by ' + data[index].author + ' ' + data[index].update_date + ':<br>' +
                    '<i>Status changed to ' + data[index].status + ' </i><br>' +
                    data[index].text +
                    '</p></div>'
                );
            });
        }
    });
}

function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};