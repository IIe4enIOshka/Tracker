/*добавление*/
$('#form-add').submit(function (event) {
    event.preventDefault();
    // event.target — это HTML-элемент form
    let formData = new FormData(event.target);
    // Собираем данные формы в объект
    let obj = {};
    formData.forEach((value, key) => obj[key] = value);
    $.ajax({
        type: $(this).attr('method'),
        url: $(this).attr('action'),
        data: JSON.stringify(obj),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (result) {
            if (result.message === 'success') {
                ShowInfo("Issue created");
            }
            if (result.message === 'fail') {
                ShowInfo("Issue creation error");
            }
        }
    });
});

function ShowInfo(message) {
    var height = $('#form-add').height();
    var width = $('#form-add').width();

    $('.message').css('height', height);
    $('.message').css('width', width);

    $('.message').text(message);

    $('#form-add').css('display', 'none');
    // $('.message').css('display', 'table-cell');

    setTimeout(function () {
        $('.message').css('display', 'none');
        $('#form-add').css('display', 'block');
        $('#form-add').get(0).reset();
    }, 3000);
}