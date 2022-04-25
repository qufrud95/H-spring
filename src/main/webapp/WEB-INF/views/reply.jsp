<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-12"> <div class="card"> 
	<div class="card-header with-border"> 
		<h3 class="card-title">댓글 작성</h3> 
	</div> 
		<div class="card-body"> 
			<div class="row"> 
				<div class="form-group col-sm-8"> 
					<input class="form-control input-sm" id="newReplyText" type="text" placeholder="댓글 입력..."> 
				</div> 
				<div class="form-group col-sm-2"> 
					<input class="form-control input-sm" id="newReplyWriter" type="text" placeholder="작성자"> 
				</div> 
				<div class="form-group col-sm-2">
					 <button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn"> 
					 	<i class="fa fa-save"></i> 저장 
					 </button> 
				</div> 
			</div> 
		</div> 
		<div class="card-footer"> 
			<ul id="replies"> </ul> 
		</div> 
		<div class="card-footer"> 
			<nav aria-label="Contacts Page Navigation"> 
				<ul class="pagination pagination-sm no-margin justify-content-center m-0"> </ul> 
			</nav> 
		</div> 
	</div> 
	</div> 
	<div class="modal fade" id="modifyModal" role="dialog"> 
		<div class="modal-dialog"> 
			<div class="modal-content"> 
				<div class="modal-header"> 
					<button type="button" class="close" data-dismiss="modal">&times;</button> 
						<h4 class="modal-title">댓글 수정창</h4> 
				</div> 
				<div class="modal-body"> 
				<div class="form-group"> 
				<label for="reply_no">댓글 번호</label>
					 <input class="form-control" id="reply_no" name="reply_no" readonly> 
				</div> 
					<div class="form-group"> 
					<label for="reply_text">댓글 내용</label>  
					<input class="form-control" id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요"> 
					</div> 
					<div class="form-group"> 
					<label for="reply_writer">댓글 작성자</label>
					 <input class="form-control" id="reply_writer" name="reply_writer" readonly> 
					 </div> 
					 </div> 
					 <div class="modal-footer"> 
					 <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button> 
					 <button type="button" class="btn btn-success modalModBtn">수정</button> 
					 <button type="button" class="btn btn-danger modalDelBtn">삭제</button> 
					 </div> 
					 </div> 
					 </div> 
					 </div>


</body>
</html>