<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리시스템</title>
<link rel="stylesheet" type="text/css" href="/choi/css/user.css"> 
<link rel="stylesheet" type="text/css" href="/choi/css/w3.css">
<script type="text/javascript"  src="/choi/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
input {
	width: 245px;
	height: 18px;
}
.btn {
	width:70px;
}
.btn > div{
	
	
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#self_intro').on('keyup', function() {
        $('#self_intro_cnt').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#self_intro_cnt').html("(100 / 100)");
        }
    });
});

</script>
</head>
<body>
<div>
	<div class="w3-col w3-light-grey h40 ">
		<div class="w3-left inblock mgl30 mgt10">It & Biz</div>
		<div class="w3-button w3-right inblock ">조회하기</div>
		<div class="w3-button w3-right inblock ">입력하기</div>
		<div class="w3-col mgt30 mgl20 ft20"><strong>직원 상세 정보</strong></div>
		<div class="w3-container mgb10">
			<div class="w3-button w3-dark-grey w3-round w3-right mgl10 mgr20 ft10" id="pre">전화면</div>
			<div class="w3-button w3-dark-grey w3-round w3-right ft10" id="submit">등록</div>
		</div>
		<div class="w3-row">
			<div class="w3-container w3-quarter " style="width: 23%;">
				 <div class="w3-panel" >
					<img src="/choi/img/img_001.jpg" alt="img_001" style="width:180px; height:160px; " class="mgl60 pdl50 mgb20">
					<div class=" w3-button w3-hover-white  w3-center" style="width:146px; height:10px;  position: relative;  left: 110px; border:2px solid lightgrey">
						 <img src="/choi/img/camera.png" alt="camara" class="" style="width:20px;height:20px; position: absolute; top: 3px; left: 30px; ">
						<div class="" style="position: absolute; top: 3px; left: 65px;" id="file">사진올리기</div>
					</div>
				</div>
				<div class="mgl20 mgt40 mgb20">
					<label class="mgr40">입사구분</label>
					<select class="w250" name="pos_gbn_code">
						<option></option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
				<div class="mgl30 mgb20">
					<label class="mgr60">군별</label>
					<select class="w250" name="mil_type">
						<option >(선택)</option>
						<option value="01">육군</option>
						<option value="02">공군</option>
						<option value="03">해군</option>
					</select>
				</div>
				<div class="mgl10 mgb20">
					<label class="" style="margin-right:8px;">KOSA등록</label>
					<select class="w250 mgl30" name="pos_gbn_code">
						<option></option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
				<div class="mgl10 mgb20">
					<label class="" style="margin-right:6px;">사업자번호</label>
					<input type="text" class="mgl30" name="cmp_reg_no" value=""   placeholder="예)123-12-12345" id="cmp_reg_no">
				</div>
			</div> 
			
			<div class=" w3-quarter" style="width: 23%;">
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*사번</label>
					<input type="text" class="mgl50" name="cmp_reg_no" value=""   disabled id="sabun">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*아이디</label>
					<input type="text" class="" name="id" value="" style="    margin-left: 35px; " id="id" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">전화번호</label>
					<input type="text" class="mgl30" name="phone" value=""   id="phone" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">연령</label>
					<input type="text" class="mgl60" name="years" value=""   id="years">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">주소</label>
					<input type="text" class="mgl60" name="zip" value="" style="width:150px;  " id="zip" placeholder="우편번호">
					<div class="w3-button w3-hover-white mgl20 w3-border w3-border-dark-grey w3-round w30" style="height:7px; position: relative; top: -2px;">
						<div style="position: relative; top: -8px; left: -10px;"><small>주소검색</small></div>
					</div>
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:8px;">직위</label>
					<select class="w250 mgl60" name="pos_gbn_code" id="pos_gbn_code">
						<option></option>
						<option value="01">사원</option>
						<option value="02">주임</option>
						<option value="03">대리</option>
						<option value="04">과장</option>
						<option value="05">차장</option>
						<option value="06">부장</option>
						<option value="07">이사</option>
						<option value="08">상무</option>
						<option value="09">전무</option>
						<option value="10">부사장</option>
						<option value="11">사장</option>
					</select>
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:8px;">등급</label>
					<select class="w250 mgl60" name="gart_level" id="gart_level">
						<option></option>
						<option value="01">기술사</option>
						<option value="02">특급기술자</option>
						<option value="03">고급기술자</option>
						<option value="04">중급기술자</option>
						<option value="05">초급기술자</option>
					</select>
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:8px;">계급</label>
					<select class="w250 mgl60" name="mil_level" id="mil_level">
						<option>(선택)</option>
						<option value="01">상사</option>
						<option value="02">중사</option>
						<option value="03">하사</option>
						<option value="04">병장</option>
					</select>
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:7px;">KOSA등급</label>
					<select class="w250 mgl20" name="gart_level" id="gart_level">
						<option></option>
						<option value="01">기술사</option>
						<option value="02">특급기술자</option>
						<option value="03">고급기술자</option>
						<option value="04">중급기술자</option>
						<option value="05">초급기술자</option>
					</select>
				</div>
				<div class="">
					<label class="" style="margin-right:6px;">업체명</label>
					<input type="text" class="mgl50" name="crm_name" value="" style="width:243px;  " id="crm_name">
				</div>
			</div>
			
			<div class="w3-quarter" style="width: 23%;">
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*한글성명</label>
					<input type="text" class="mgl30" value=""    id="name">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*패스워드</label>
					<input type="password" class="mgl30"  value=""   id="pwd" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*핸드폰번호</label>
					<input type="text" class="" value="" style="    margin-left: 15px; " id="hp" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px; position: relative; left: -25px;">*이메일</label>
					<input type="text" class="" value="" style="width:110px;   position: relative; left: -25px;" id="email">
					<select style="height: 25px;">
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@nate.com</option>
					</select>
				</div>
				<div class=" mgb20" style="position: relative; top: -2px;'">
					<input type="text" class="w400" value="" style="  position: relative;  left: -35px;" id="addr1" placeholder="주소">
				</div>
				<div class=" mgb20">
					<label class="mgl10" style="margin-right:8px;">부서</label>
					<select class="w250 mgl50" name="deft_code" id="deft_code">
						<option></option>
						<option value="01">경영지원부</option>
						<option value="02">영업부</option>
						<option value="03">시스템지원부</option>
						<option value="04">개발부</option>
						<option value="05">부설연구소</option>
					</select>
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:8px;">투입여부</label>
					<select class="w250 mgl30" name="deft_code" id="deft_code">
						<option></option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
				<div class=" mgb10">
					<label class="" style="margin-right:8px;">입영일자</label>
					<input type="date" class="mgl30 h30" id="mil_startdate" >
				</div>
				<div class=" mgb10">
					<label class="" style="margin-right:8px; position: relative; left: -10px;">*입사일자</label>
					<input type="date" class="mgl20" id="join_day">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px; position: relative; left:-15px;">사업자등록증</label>
					<input type="text" class="" name="cmp_reg_no" value=""   disabled id="cmp_reg_image">
				</div>
				<div class="">
					<label class="" style="margin-right:1px; ">이력서</label>
					<input type="text" class="mgl50" name="cmp_reg_no" value=""   disabled id="carrier">
				</div>
			</div>
			
			<div class=" w3-quarter " style="width: 23%;">
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">영문성명</label>
					<input type="text" class="mgl30" value=""    id="eng_name">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px; position: relative; left: -25px;">*패스워드 확인</label>
					<input type="password" class=""  value="" style="    position: relative; left: -15px; " id="pwd2" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">주민번호</label>
					<input type="text" class="mgl30" value=""   id="reg_no" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px; position: relative; left: -60px;">직종체크</label>
					<select style="height: 25px; position: relative; left:-60px;" name="join_gbn_code" id="join_gbn_code">
						<option></option>
						<option value="01">프로그래머</option>
						<option value="02">기술자(엔지니어)</option>
						<option value="03">개발자(설계자)</option>
						<option value="04">기획자</option>
						<option value="05">관리자</option>
					</select>
					<label class="" style="margin-right:6px; position: relative; left: -40px;">성별</label>
					<select class="w120"style="height: 25px; position: relative; left: -30px; " name="sex" id="sex">
						<option></option>
						<option value="01">남성</option>
						<option value="02">여성</option>
						
					</select>
				</div>
				<div class=" mgb20" style="position: relative; top: -3px;'">
					<input type="text" class="w350"  id="addr2" placeholder="상세주소">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:8px;">부서</label>
					<select class="w250 mgl60" name="deft_code" id="deft_code">
						<option></option>
						<option value="01">경영지원부</option>
						<option value="02">영업부</option>
						<option value="03">시스템지원부</option>
						<option value="04">개발부</option>
						<option value="05">부설연구소</option>
					</select>
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:8px;">투입여부</label>
					<select class="w250 mgl30" name="deft_code" id="deft_code">
						<option></option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
				<div class=" mgb10">
					<label class="" style="margin-right:8px;">전역일자</label>
					<input type="date" class="mgl30 h30" id="mil_enddate">
				</div>
				<div class=" mgb10">
					<label class="" style="margin-right:8px; position: relative; left: -10px;">*퇴사일자</label>
					<input type="date" class="mgl20" id="retire_day">
				</div>
				<div class=" mgb10">
					<div class="w3-button w3-hover-white w3-border w3-border-dark-grey w3-round btn" style="height:7px; position: relative; top: -2px;">
						<div class="mgl20" style="position: relative; top: -8px; left: -10px;"><small>미리보기</small></div>
					</div>
					<div class="mgl20 w3-button w3-hover-white w3-border w3-border-dark-grey w3-round btn" style="height:7px; position: relative; top: -2px;">
						<div class="mgl20" style="position: relative; top: -8px; left: -10px;"><small>등록</small></div>
					</div>
				</div>
				<div class=" mgb10">
					<div class="w3-button w3-hover-white w3-border w3-border-dark-grey w3-round btn" style="height:7px; position: relative; top: -2px;">
						<div class="mgl20" style="position: relative; top: -8px; left: -10px;"><small>미리보기</small></div>
					</div>
					<div class="mgl20 w3-button w3-hover-white w3-border w3-border-dark-grey w3-round btn" style="height:7px; position: relative; top: -2px;">
						<div class="mgl20" style="position: relative; top: -8px; left: -10px;"><small>등록</small></div>
					</div>
				</div>
			</div>
			<div class="inblock" style="position: relative; top: -20px;">
							<label class="mgl30" style="position: relative; top:-50px;">자기소개</label>
							<label class="w3-text-grey  "id="self_intro_cnt" style="position: relative; top:-30px; left: -63px; font-size: 9pt;">(0 / 100) </label> 
							<textarea name="self_intro" cols="69" id="self_intro" style="resize: vertical; height:60px; position: relative; left: -10px;"placeholder="100자 내외로 적으시오."></textarea>
			</div>
		</div>
	</div>
</div>
</body>
</html>