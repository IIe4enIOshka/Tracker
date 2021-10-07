//Загрузка
$(document).ready(function () {

    getIssueById();
});

function getIssueById() {
    var _id = getUrlParameter('id');

    $('#idIssue').val(_id.toString());

    let obj = {
        id: _id
    };

    $.ajax({
        type: 'post',
        url: '/get_issue',
        data: JSON.stringify(obj),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (data) {
            $('.body__issue').html("");

            $('.body__issue').append(
                '<div class="row">' +
                '<div class="col-md-3">' +
                '<b>Status</b>' +
                '</div>' +
                '<div class="col-md-9">' +
                data.status +
                '</div>' +
                '</div>' +

                '<div class="row">' +
                '<div class="col-md-3">' +
                '<b>Start date</b>' +
                '</div>' +
                '<div class="col-md-9">' +
                data.start_date +
                '</div>' +
                '</div>' +

                '<div class="row">' +
                '<div class="col-md-3">' +
                '<b>Author</b>' +
                '</div>' +
                '<div class="col-md-9">' +
                data.author +
                '</div>' +
                '</div>' +

                '<div class="body__description">' +
                '<div class="row">' +
                '<b>Description</b>' +
                '</div>' +
                '<div class="row body__description__text">' +
                '<p>' + data.description + '</p>' +
                '</div>' +
                '</div>'
            );
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