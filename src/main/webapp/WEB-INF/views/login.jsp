<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<jsp:directive.include file="/WEB-INF/views/common/taglib.jsp"/>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="ko" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="ko">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>PS&M Casegrapher | Login Page</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" />
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/theme/default.css" id="theme" />
	<link rel="stylesheet" href="/resources/css/font-awesome/css/font-awesome.css" /><!-- 폰트는 호출 경로와 사용 경로가 같아야 함. -->
	<link rel="stylesheet" href="/js/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/js/bootstrap/css/bootstrap-theme.min.css" />
	<link rel="stylesheet" href="/css/d3net.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/js/jquery-ui/jquery-ui.css" />

	<script type="text/ecmascript" src="/js/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/js/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>

	<script type="text/javascript" src="/js/ajax.js"></script>
</head>
<body class="pace-top">

	<div class="login-cover">
		<div class="login-cover-image">
			<img src="/img/login-bg/bg-3.jpg" data-id="login-cover-image" alt="" />
		</div>
		<div class="login-cover-bg"></div>
	</div>
	<div id="page-container" class="in">
		<!-- begin login -->
		<div class="login login-v2" data-pageload-addclass="animated fadeIn">
			<!-- begin brand -->
			<div class="login-header">
				<div class="brand">
					<span class="logo"></span> PS&M Casegrapher <small>관리자 시스템 입니다.</small>
				</div>
			</div>
			<!-- end brand -->
			<div class="login-content">
				<div class="form-group m-b-20">
					<input type="text" class="form-control input-lg" placeholder="ID" id="mbrId" name="mbrId" value="${savedId}" />
				</div>
				<div class="form-group m-b-20">
					<input type="password" class="form-control input-lg" placeholder="Password" id="pw" name="pw" value="" />
				</div>
				<div class="checkbox m-b-20">
					<label><input type="checkbox" id="saveIdYn" name="saveIdYn" value="Y" <c:if test="${savedId ne ''}">checked</c:if> /> ID 저장</label>
				</div>
				<div class="login-buttons">
					<button type="button" class="btn btn-success btn-block btn-lg" id="loginBtn">로그인하기</button>
				</div>
				<div class="m-t-20">
					<!-- 회원 등록은 다음 연락처로 문의 해주세요. -->
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var url = '/loginProcAjax';
		$(function() {
			$('#mbrId, #pw').keydown(function(key){
				if(key.keyCode == 13){
					$('#loginBtn').click();
				}
			});
		});
		
		$('#loginBtn').on('click',function(){

			if ($('#mbrId').val().isBlank()) {
				alert('ID를 입력해주세요.');
				$('#mbrId').focus();
				return;
			}
			
			if ($('#pw').val().isBlank()) {
				alert('password를 입력해주세요.');
				$('#pw').focus();
				return;
			}

		CALL_AJAX.reqAjax({
				type		: 'POST',
    			url			: url,
    			dataType	: 'json',
    			data		: {'mbrId': $('#mbrId').val(), 'pw': $('#pw').val(), 'saveIdYn': $('#saveIdYn:checked').val()},
    			success		: ajaxSuccFunc,
    			error       : ajaxFailFunc
			});
		});
		 
		var ajaxSuccFunc = function(data){
			if (data.status == 'success') {
				location.href = '/index';				
			} else {
				alert(data.msg);
			}
		}

		var ajaxFailFunc = function(){
			alert('네트워크 소통이 원할하지 않습니다.');
		}
	</script>
</body>
</html>
