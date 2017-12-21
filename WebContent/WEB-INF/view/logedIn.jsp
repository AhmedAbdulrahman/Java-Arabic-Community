<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <!-- BOOTSTRAP DEPENDENCIES -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <!-- BOOTSTRAP DEPENDENCIES END-->
    <style type="text/css">body{width: 100% !important;}</style>
</head>
<body>

<!-- Initialize new variables with c tag -->
<c:set var="myUserId" value="loggedInUserId" />
<c:set var="myPicture" value="loggedInUserPicture" />
<c:set var="myNickname" value="loggedInUserNickname" />
<c:set var="myRegDate" value="loggedInUserRegDate" />
<c:set var="myVote" value="loggedInUserVote" />
<c:url var="User" value="/Users">
	<c:param name="answerUserId" value="${sessionScope[myUserId]}" />
</c:url>
<!-- ------------------------------------------------------------------ -->

<nav class="navbar navbar-inverse" >
    <div class="container-fluid">
        <div class="navbar-header" id="navHeader">
      		<a href="https://java-arabic-community.herokuapp.com/AllQuestions" title="Go to Home page">
            	<img class="nav-logo" alt="Logo not found!" src="${pageContext.request.contextPath}/resources/images/miniLogo.png">
            </a>
    </div>
        <ul class="nav navbar-nav navbar-center">
            <li class="nav-center-li">
                <form:form action="Search" method="POST">
                    <div class="input-group ">
                        <spring:message code="label.search" var="LabelSearchQuestion" />
                        <span class="input-group-addon" style="background-color: #333; color: white;">
                            <spring:message code="label.searchQuestion" /> :
                        </span>
                        <input type="text" name="theSearchName" class="form-control">
                        <div class="input-group-btn">
                           <button class="btn btn-default" type="submit" style="margin-top: 0px;">
                               <i class="glyphicon glyphicon-search"></i>
                           </button>
                        </div>
                    </div>
                </form:form>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li title="Go to profile">
                <div class="nav-img-div">
                    <img class="nav-prof-img" alt="Profile picture" src="data:image/jpeg;base64,${sessionScope[myPicture]}"> 
                </div>
                <div style="float: left; padding: 0; width:90px; color: white; font-size: 11px; cursor: pointer;">
                    <span onclick="window.location.href='${User}'">${sessionScope[myNickname] } </span><br> 
                    <span>${sessionScope[myRegDate] }</span><br> 
                    <span>&#9813; ${sessionScope[myVote] }</span>
                </div>	
            </li>
            <li><a href="Loguot"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </ul>
    </div>
</nav>
</body>
</html>