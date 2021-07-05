<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="w3-dark-grey ">
<head>
<meta charset="UTF-8">
<title>인사시스템</title>
<link rel="stylesheet" type="text/css" href="/choi/css/user.css"> 
<link rel="stylesheet" type="text/css" href="/choi/css/w3.css">
<script type="text/javascript"  src="/choi/js/jquery-3.6.0.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
	
	$('#insert').click(function(){
		$('#frm').attr('action', '/choi/insaSystem/insaAdd.biz');
		$('#frm').submit();
	});
});
</script>
</head>
<body class="all">
	<h3 class="w3-content w3-text-yellow mgt30 mgb60"> it&biz </h3>
	
<form id="frm" name="frm" method="post" action="">
	<div class="w3-topbar w3-bottombar w3-border-grey pdt20 middle w3-center ft30" ><strong>인사관리 시스템</strong>
		<h5 class="w3-text-light-grey mgt50 ">인사정보를 입력하겠습니다.
			<button class="w3-round mgl20 btn" id="insert">입력</button>
		</h5>
		<h5 class="w3-text-light-grey mgt20">인사정보를 조회하겠습니다.
			<button class="w3-round mgl20 btn" id="select">조회</button>
		</h5>
	</div>
</form>
</body>
</html>