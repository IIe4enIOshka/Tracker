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
		<div class="row">
			<div class="container__border padding">
				<div class="header">
					<p>Create issue</p>
				</div>
				<div class="body">
					<div class="message"></div>
					<form id="form-add" action="/add_issue" method="post">
						<div class="row body__name">
							<div class="col-md-2">Name</div>
							<div class="col-md-10">
								<input class="body__name__input" type="text" name="name" value="" required>
							</div>
						</div>
						<div class="row body__name">
							<div class="col-md-2">Author</div>
							<div class="col-md-4">
								<input id="fullName" class="body__name__input" type="text" name="author" value="" readonly required>
							</div>
						</div>
						<div class="row body__description">
							<div class="col-md-2">Description</div>
						</div>
						<div class="form__description__input">
							<div class="row">
								<textarea name="description" class="body__description__input__text" type="text" required></textarea>
							</div>
							<div class="row">
								<input class="body__input__save" type="submit" value="Save">
								<a class="body__input__cancel" href="/index">Cancel</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/getMe.js"></script>
	<script type="text/javascript" src="resources/js/add-issue.js"></script>

</body>
</html>