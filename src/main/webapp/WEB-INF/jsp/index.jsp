<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/media.css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <sec:authorize access="!isAuthenticated()">
            <a class="container__create-issue" href="/registration">Sign up</a>
            <a class="container__create-issue" href="/login">Sign in</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <a class="container__create-issue" href="/createIssue">Create issue</a>
            <p class="container__create-issue__static">${pageContext.request.remoteUser}</p>
            <a class="container__create-issue" href="/logout">Logout</a>
        </sec:authorize>
    </div>
    <div class="row">
        <div class="container__border padding">
            <div class="header">
                <p>Issue Tracker</p>
            </div>
            <div class="body">
                <p style="text-align: center;">No issue</p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/get-issues.js"></script>

</body>
</html>