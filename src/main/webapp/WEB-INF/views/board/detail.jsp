<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="app" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${app}/resources/css/detail.css" >
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>

body {

	padding-top: 70px;

	padding-bottom: 30px;
	

}

.board_title {

	font-weight : 700;

	font-size : 22pt;

	margin : 10pt;

}

.board_info_box {

	color : #6B6B6B;

	margin : 10pt;

}

.board_author {

	font-size : 10pt;

	margin-right : 10pt;

}

.board_date {

	font-size : 10pt;

}

.board_content {

	color : #444343;

	font-size : 12pt;

	margin : 10pt;

}

.board_tag {

	font-size : 11pt;

	margin : 10pt;

	padding-bottom : 10pt;

}

table{

	maring : 0 auto 0 auto !important;
}

</style>


<title>Insert title here</title>
</head>
<body>

<article>

		<div class="container" role="main" style="width : 1000px;">

			<h2>게시물</h2>

			

			<div class="bg-white rounded shadow-sm">

				<div class="board_title"><c:out value=" 제목 : ${boardDTO.title}"/></div>
				<div class="board_title"><c:out value="${boardDTO.no}번"/></div>
				<div class="board_info_box">

					<span class="board_author"><c:out value=" 작성자 : ${boardDTO.name}"/></span>
					<span class="board_date"><c:out value=" 작성일 : ${boardDTO.regdate}"/> </span> 
					<span class="board_date" id = "board_file"><c:out value=" 파일명 : ${boardDTO.fileName}"/></span>
					
				</div>
				<div class="board_content">${boardDTO.content}</div>
			</div>

			

			<div style="margin-top : 70px">
	

				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate" onclick="location.href='../'">리스트</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnDelete" onclick="location.href='update'">수정</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='delete'">삭제</button>

			</div>
	
		</div>
		<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">

				<form:hidden path="bid" id="bid"/>

				<div class="row">

					<div class="col-sm-10">

						<form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>

					</div>

					<div class="col-sm-2">

						<form:input path="reg_id" class="form-control" id="reg_id" placeholder="댓글 작성자"></form:input>

						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>

					</div>

				</div>

				</form:form>

			</div>

			<!-- Reply Form {e} -->

			

			<!-- Reply List {s}-->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>

				<div id="replyList"></div>

			</div> 


		

	</article>	
</body>

</html>
