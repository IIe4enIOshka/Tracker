<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RegistrationPage</title>
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/media.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/error-message.css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="container__border padding">
            <div class="header">
                <p>Registration</p>
            </div>
            <div class="body">
                <form id="registration" action="/addUser" method="post">
                    <p id="message" class="msg">...</p>
                    <div class="registration">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <span>Username</span>
                            </div>
                            <div class="col-md-10">
                                <input id="usernameInput" type="text" placeholder="Username" name="username" required>
                            </div>
                            <p id="username-error" class="errmsg">Username from 5 to 31 characters</p>
                        </div>

                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <span>Password</span>
                            </div>
                            <div class="col-md-10">
                                <input id="password" type="password" placeholder="Password" name="password"
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required>
                            </div>
                            <p id="password-error" class="errmsg">The password must contain at least 1 digit and at least 8 characters.</p>
                        </div>

                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <span>Confirm password</span>
                            </div>
                            <div class="col-md-10">
                                <input id="passwordConfirmInput" type="password" placeholder="Confirm password" required>
                            </div>
                            <p id="confirm-error" class="errmsg">Password mismatch</p>

                        </div>

                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <span>Fullname</span>
                            </div>
                            <div class="col-md-10">
                                <input type="text" placeholder="Fullname" name="fullname" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <input id="register" class="body__input__save" type="submit" value="Sign up">
                        <a class="body__input__cancel" href="/index">Cancel</a>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/registration.js"></script>

</body>
</html>