<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoginPage</title>
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
                <p>Login</p>
            </div>
            <div class="body">
                <form id="registration" action="/login" method="post">
                    <div class="msg errmsg"></div>
                    <div class="registration">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <span>Username</span>
                            </div>
                            <div class="col-md-10">
                                <input type="text" placeholder="Username" name="username" required>
                            </div>
                        </div>

                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <span>Password</span>
                            </div>
                            <div class="col-md-10">
                                <input type="password" placeholder="Password" name="password" required>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <input class="body__input__save" type="submit" value="Sign in">
                        <a class="body__input__cancel" href="/index">Cancel</a>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>

</body>
</html>