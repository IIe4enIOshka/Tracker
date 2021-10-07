/*Регистрация*/
$(document).ready(function () {
    var checkUsername = function () {
        var currval = $('#usernameInput').val();
        if (currval.length < 5 || currval.length > 31) {
            $('#username-error').slideDown();
            return false;
        }
        $('#username-error').slideUp();
        return true;
    }

    var checkPassword = function () {
        var currval = $('#password').val();
        var digitRegex = /\d+/;
        if (!digitRegex.test(currval) || currval.length < 8) {
            $('#password-error').slideDown();
            return false;
        }
        $('#password-error').slideUp();
        return true;
    }

    var checkPasswordConfirm = function (params) {
        var password = $('#password').val();
        var confirm = $('#passwordConfirmInput').val();
        if (password !== confirm) {
            $('#confirm-error').slideDown();
            throw new Error('Password mismatch');
            return false;
        }
        $('#confirm-error').slideUp();
        return true;
    }

    $('#usernameInput').on('blur', checkUsername);
    $('#password').on('blur', checkPassword);
    $('#passwordConfirmInput').on('blur', checkPasswordConfirm);
    $('#registration').submit(function (event) {
        event.preventDefault();
        var foundErrors = false;
        if (!checkUsername()) foundErrors = true;
        if (!checkPassword()) foundErrors = true;
        if (!checkPasswordConfirm()) foundErrors = true;
        if (foundErrors) {
            return;
        }

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
                if (result.status === 'error') {
                    $('.msg').slideDown();
                    $('.msg').text(result.message);
                }

                if (result.status === 'success') {
                    $(location).attr('href', "/login");
                }
            }
        });
    });
});