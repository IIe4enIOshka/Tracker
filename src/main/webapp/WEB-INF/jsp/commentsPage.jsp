<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/media.css"/>
</head>
<body>
<input id="loginUser" type="text" value="${pageContext.request.remoteUser}" hidden>
<div class="container">
    <div class="row container__border">
        <div class="padding">
            <div class="header">
                <p>Internal error in annual PDF report</p>
            </div>
            <div class="body">
                <div class="body__issue">
                    <div class="row">
                        <div class="col-md-3">
                            <b>Status</b>
                        </div>
                        <div class="col-md-9">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <b>Start date</b>
                        </div>
                        <div class="col-md-9">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <b>Author</b>
                        </div>
                        <div class="col-md-9">

                        </div>
                    </div>
                    <div class="body__description">
                        <div class="row">
                            <b>Description</b>
                        </div>
                        <div class="row body__description__text">

                        </div>
                    </div>
                </div>
                <div class="body__comments">
                    <div class="row">
                        <b>Comments:</b>
                    </div>
                    <div class="body__comments__text">
                        <div class="row">
                            <span>No comments</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="message"></div>
        <form id="form__comments" class="form__comments" action="/add_comment" method="post">
            <input id="idIssue" type="text" name="idIssue" hidden>
            <div class="row">
                <p class="">Add comment:</p>
            </div>
            <div class="row form__comments__status">
                <div class="col-md-2">
                    <p>Status:</p>
                </div>
                <div class="col-md-10">
                    <select name="status" class="form__comments__select__status">
                        <option value="Resolved">Resolved</option>
                        <option value="Created">Created</option>
                        <option value="Closed">Closed</option>
                    </select>
                </div>
            </div>
            <div class="row form__comments__author">
                <div class="col-md-2">
                    <p>Author:</p>
                </div>
                <div class="col-md-10">
                    <input id="fullName" name="author" class="form__comments__input__author" type="text" readonly>
                </div>
            </div>
            <div class="row">
                <p>Text</p>
            </div>
            <div class="form__comments__input">
                <div class="row">
                    <textarea name="text" class="form__comments__input__text" type="text" required></textarea>
                </div>
                <div class="row">
                    <input class="form__comments__input_button" type="submit" value="Add">
                    <a class="body__input__cancel" href="/index">Cancel</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/get-issue-by-id.js"></script>
<script type="text/javascript" src="resources/js/get-comments.js"></script>
<script type="text/javascript" src="resources/js/getMe.js"></script>
<script type="text/javascript" src="resources/js/add-comment.js"></script>


</body>
</html>