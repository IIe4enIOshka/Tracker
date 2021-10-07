/*обновление*/
function updateIssue() {

    let status = $('.form__comments__select__status').val();
    let id = $('#idIssue').val();

    let obj = {
        id: id,
        status: status
    };
    $.ajax({
        type: "post",
        url: "/update_issue",
        data: JSON.stringify(obj),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (result) {
            getComments();
            getIssueById();
        }
    });
};

/*добавление*/
$('#form__comments').submit(function (event) {
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
                updateIssue();
                ShowInfo("Comment created")
            }
            if (result.message === 'fail') {
                ShowInfo("creation error")
            }
        }
    });
});

function ShowInfo(message) {
    var height = $('#form__comments').height();
    var width = $('#form__comments').width();

    $('.message').css('height', height);
    $('.message').css('width', width);

    $('.message').text(message);

    $('#form__comments').css('display', 'none');
    $('.message').css('display', 'flex');
    scroll();
    setTimeout(function () {
        $('.message').css('display', 'none');
        $('#form__comments').css('display', 'block');
        $('.form__comments__input__text').val("");
        scroll();
    }, 3000);
}

function scroll() {
    $('html, body').animate({scrollTop: '+=150px'}, 800);
}
