<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${request.getContextPath()}" /> <!-- 현재 어플리케이션의 루트  context path 까지  -->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>

table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}


.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}



</style>
<link rel="stylesheet" href="<c:url value="/webjars/jquery-ui/1.13.0/jquery-ui.css" />" />
<script type="text/javascript" src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/webjars/jquery-ui/1.13.0/jquery-ui.js" />"></script>
<script type="text/javascript">
$( function() {
    $( "#tags" ).autocomplete({
      source: 'autocomplete_data',
	  minLength : 2,
 	  delay    :300,
	  select : function(event, ui) {
		/* alert(ui.item.value + '가 리턴됨'); */
	  }
    });
});
</script>
 
<!-- <script type="text/javascript">
var searchForm = $("#searchForm");
$("#searchForm button").on("click",function(e)){
	$.ajax({
		type: 'GET',
		url : "/board/list",
		data : $("form[name=searchForm]").serialize(),
		error : function( 파라미터 ) {

			console.log("error");

			}
		success : function(result){
			//테이블 초기화
			console.log("sex");
			$('#board-list > tbody').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
						str+="<td>"${recordCount - vs.index - ((pg-1)*pageSize)}"</td>"
						str+="<td>"<a href="${dto.no}/">${dto.title}</a>"</td>"
						str+="<td>"${dto.name}"</td>"
						str+="<td>"<fmt:formatDate value="${dto.regdate}" type="date" />"</td>"
						str+="<td>"${dto.readcount}"</td>"
					str+="</tr>"
					$('#board-list').append(str);
        		})				 
			}
		}
	})
}
</script> -->
</head>
<body>
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3 style="margin-left:132px;">만화 게시판</h3>
        </div>
  </div>
  <!-- search area -->
   <div id="board-search" style="margin:0 0 0 165px;">
        <div class="container">
        
            <div class="search-window">
                <form action="searchForm" action="/board/list" method='get'>
                    <div class="search-wrap">
                        <select name ="type">
                        	<option value="title">제목</option>
                        	<option value="content">내용</option>
                        	<option value="name">작성자</option>
                        </select>
                        
                        <!-- Autocomplete -->
                        <input id="tags" type="search" name="keyword" placeholder="검색어를 입력해주세요." value="">
                        <button class="btn btn-dark" style="margin-top:19px;">검색</button>
                    </div>
                     <a href="insert" style="padding-left:30px">글쓰기</a>
                </form>
            </div>
        </div>
    </div>

 <div id="board-list" style="margin:0 0 0 165px;">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
					<td colspan="5" style="padding-left:30px">현재페이지:${pg} / 전체페이지수:${pageCount}</td>
				</tr>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-name">작성자</th>
                    <th scope="col" class="th-num">작성일</th>
                    <th scope="col" class="th-num">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="dto" varStatus="vs">
                <jsp:useBean id="now" class="java.util.Date" />
			    <fmt:formatDate value="${now}" type="date" pattern="yyyyMMdd" var="nowDate"/>
				<fmt:formatDate value="${dto.regdate}" type="date" pattern="yyyyMMdd" var="postDate"/>
				<tr>
					<td>${recordCount - vs.index - ((pg-1)*pageSize)}</td>
					<td><a href="${dto.no}/">${dto.title}</a></td>
					<td>${dto.name}</td>
					<td>										
						<c:choose>
							<c:when test="${nowDate - postDate != 0}">
								<fmt:formatDate value="${dto.regdate}"   pattern="YYYY/MM/dd" type="date" /> <!-- 오늘 등록자 아니라면?--> 
							</c:when>
							<c:when test="${nowDate - postDate == 0}">
								<fmt:formatDate value="${dto.regdate}"  pattern="hh:mm:ss" type="time" /> <!-- 오늘 등록자라면?--> 
							</c:when>
						</c:choose> 
						<%-- <fmt:formatDate value="${dto.regdate}" type="date" /> --%>
					</td>
					<td>${dto.readcount}</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
						<c:if test= "${startPage != 1}">
						<a href = "../${startPage -1}/"> 이전블럭 </a>
						</c:if>
							<c:forEach begin="${startPage}" end ="${endPage}" var="p"> 
							<c:if test = "${p == pg}">${p}</c:if>
							<c:if test = "${p != pg}"><a href="../${p}/">${p}</a></c:if>
						</c:forEach>
						
						<c:if test= "${endPage != pageCount}">
						<a href = "../${endPage+1}/"> 다음블럭 </a>
						</c:if>					
					</td>
				</tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<%-- 
<table border="1">
<caption>게시물 리스트</caption>

<tr>
	<td colspan="5">현재페이지:${pg} / 전체페이지수:${pageCount}</td>
</tr>

<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<c:forEach items="${list}" var="dto" varStatus="vs">
<tr>
	<td>${recordCount - vs.index - ((pg-1)*pageSize)}</td>
	<td><a href="${dto.no}/?vn=${recordCount - vs.index - ((pg-1)*pageSize)}">${dto.title}</a></td>
	<td>${dto.name}</td>
	<td><fmt:formatDate value="${dto.regdate}" type="date" /></td>
	<td>${dto.readcount}</td>
</tr>
</c:forEach>

<tr>
	<td colspan="5">
			
		<c:if test= "${startPage != 1}">
		<a href = "../${startPage -1}/"> 이전블럭 </a>
		</c:if>
			<c:forEach begin="${startPage}" end ="${endPage}" var="p"> 
			<c:if test = "${p == pg}">${p}</c:if>
			<c:if test = "${p != pg}"><a href="../${p}/">${p}</a></c:if>
		</c:forEach>
		
		<c:if test= "${endPage != pageCount}">
		<a href = "../${endPage+1}/"> 다음블럭 </a>
		</c:if>
		
	</td>
</tr>
</table>
<br/>
<a href="insert">글쓰기</a> --%>
</body>
</html>