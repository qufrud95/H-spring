<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="app" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  weight : 200px;
  height : 30px;
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
  border: 5px solid transparent;
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




</style>
<title>Insert title here</title>
<script type="text/javascript" src="${app}/resources/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 추가 --> 
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<script type="text/javascript"> window.jQuery3_4_1 = jQuery.noConflict(true); </script> 
<script type="text/javascript" src="../../resources/quick_photo_uploader/popup/jindo.min.js" charset="utf-8"></script> 
<script type="text/javascript" src="../../resources/quick_photo_uploader/popup/jindo.fileuploader.js" charset="utf-8"></script> 
<script type="text/javascript" src="../../resources/quick_photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script> -->

</head>
<body>
<article>
<form method="post" enctype="multipart/form-data" id="frm">
<table style="width:1080px; margin : 0 150px 0 150px; margin-top:100px;">
<caption style ="margin-bottom : 10px;">게시물 쓰기</caption>
<tr>
   <th>제목</th>
   <td><input type="text" name="title" autofocus="autofocus" 
      required="required"/></td>
</tr>
<tr>
   <th>이름</th>
   <td><input type="text" name="name" required="required"  /></td>
</tr>
<tr>
   <th>비밀번호</th>
   <td><input type="password" name="password" required="required" /></td>
</tr>
<tr>
   <th>내용</th>
   <td> 
   <!-- <textarea name="content" rows="5" cols="40" required="required"></textarea> -->
   <textarea name="content" id="content" rows="10" cols="100"></textarea>
   </td>
</tr>

<tr>
	<th>업로드</th>
	<td><input type="file" name ="uploadFile"/></td>
</tr>

<tr>
   <td colspan="2" align="center">
   <input type="submit" class="btn btn-dark" id="savebutton" value="완료" />
 <!--   <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button> -->
   </td>
</tr>
</table>
</form>
</article>
 
<!--  <div class ='uploadDiv'>
	<input type ='file' name ='uploadFile' multiple>
</div>

<div class ='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<div class = 'uploadResult'>
	<ul>
	</ul>
</div>

<button id = 'uploadBtn'>Upload</button>  -->
<script type="text/javascript" src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<script>
function showImage(fileCallPath){
	/* alert(fileCallPath); */
	$(".bigPictureWrapper").css("display","flex").show();
	$(".bigPicture")
	.html("<img src='${app}/display?fileName=" +encodeURI(fileCallPath)+"'>")
	.animate({width: '100%', height: '100%'}, 1000);
}

	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
		setTimeout(()=> {
			$(this).hide();
		}, 1000);
	});
		
	$(document).ready(function(){
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880;
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
	
		
		var cloneObj = $(".uploadDiv").clone();
		
		var uploadResult = $(".uploadResult ul");
		
			function showUploadedFile(uploadResultArr){
				var str = "";
				$(uploadResultArr).each(function(i, obj){
					if(!obj.image){
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						var fileLink = fileCallPath.replace()
						str += "<li><div><a href='${app}/download?fileName="+fileCallPath+"'>"+"<img src = './resources/img/attach.png'>"+obj.fileName+"</a>"+
								"<span data-file=\'"+fileCallPath+"\' data-type='file'>X</span>"+"</div></li>"
					}else{
						//str += "<li>" + obj.fileName + "</li>"
						var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+ obj.fileName);
						
						var originPath = obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName;
						
						originPath = originPath.replace(new RegExp(/\\/),"/");
						str += "<li><a href =\"javascript:showImage(\'"+originPath+"\')\"><img src='${app}/display?fileName="+fileCallPath+"'></a>"
								+ "<span data-file=\'"+fileCallPath+"\' data-type='image'>X</span>"+"</li>";
								
						
						
						//str += "<li><img src = '${app}/display?fileName="+fileCallPath+"'><li>";
					}
				});
				uploadResult.append(str);
			}
		$(".uploadResult").on("click","span", function(e){
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url: 'deleteFile',
				data: {fileName: targetFile, type: type},
				dataType: 'text',
				type: 'POST',
					success: function(result){
						alert(result);
					}
			});
		});

		
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			for(var i = 0; i < files.length ; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: 'uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
					type: 'POST',
					dataType: 'json',
						success: function(result){
						console.log(result);
						
						showUploadedFile(result);
						
						$(".uploadDiv").html(cloneObj.html());
				}
			});
		});
	});
	
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",
	 sSkinURI: "../../resources/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	
	});
	
	   $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        //editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	 }) 
	 
	 

	

	
</script>

</body>
</html>
