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
.filebox label {
 display: inline-block; 
 padding: .5em .75em; 
 color: #999; 
 font-size: inherit; 
 line-height: normal; 
 vertical-align: middle; 
 background-color: #fdfdfd; 
 cursor: pointer; 
 border: 1px solid #ebebeb; 
 border-bottom-color: #e2e2e2; 
 border-radius: .25em; 
 }
.filebox input[type="file"] 
{ /* 파일 필드 숨기기 */ 
position: absolute; 
width: 1px; 
height: 1px; 
padding: 0; 
margin: -1px; 
overflow: hidden; 
clip:rect(0,0,0,0);
border: 0; 
 }



input {
	width: 245px;
	height: 18px;
}
.btn {
	width:70px;
}

</style>
<script type="text/javascript">
function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
		$('#addr1').val(roadAddrPart1);
		$('#addr2').val(addrDetail);
		$('#zip').val(zipNo);
	/*document.form.addr1.value = roadAddrPart1;
	 documentform.addr2.value = addrDetail;
	 document.form.zip.value = zipNo; */
		};
$(document).ready(function() {
	
//phone event
	//*표시
	$('#pwd').on("propertychange change keyup paste input", function(){
		var value = $(this).val();
		var res = $(this). value.replace(/(\[a-zA-Z0-9])(?=(\d[a-zA-Z0-9]))/g, '*')
		/* res = value.replace (/(\[a-zA-Z0-9])(?=(\d[a-zA-Z0-9]))/g, '*')*/
		/* .replace(/(\d{6})(\d{7})/g, '$1-$2'); */
	  /* var a = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z]/;
		res = value.replce(a,'*') */
	    
		
		
	});
	
	$('.tel').keyup(function(){
		
 		 	var selection = window.getSelection().toString();
 		    if ( selection !== '' ) {
 		        return;
 		    }
 			var phone = $(this).val()
 			
 			res = phone.replace(/-/g, '').replace(/(\d{2,3})(\d{3,4})(\d{4})/g, '$1-$2-$3');
 			$(this).val(res); 
	})


	
//사업자등록증	event	
		$('#cmp_reg_no').keyup(function(){
			
 		 	var selection = window.getSelection().toString();
 		    if ( selection !== '' ) {
 		        return;
 		    }
 			var cmpreg = $(this).val();
 			res = cmpreg.replace(/-/g, '').replace(/(\d{3})(\d{2})(\d{5})/g, '$1-$2-$3');
 			$(this).val(res);
		});
	//주민번호 event
			//하이픈
 		$('#reg_no').keyup(function(){
 		 	var selection = window.getSelection().toString();
 		    if ( selection !== '' ) {
 		        return;
 		    }
 			var regno = $(this).val();
 			res = regno.replace(/-/g, '').replace(/(\d{6})(\d{7})/g, '$1-$2');
 			$(this).val(res); 
 			
 			
 			
 			
 		  //연령계산  
			var nine = Number(1900);
			var two = Number(2000);
 			var date = new Date();
 			var year = date.getFullYear();
 			var cut = regno.substring(0,2);
 			var index = cut.indexOf(0,0);
 			var cut = Number(cut); 
 			
 			if(index == -1 ){
				var birth = cut + nine				
 				var res = year - birth;
 			$('#years').val(res);
 			if($(this).val() == ''){
 				$('#years').val('');
 			}
 			}else{
 				var birth = cut + two
 				var res = year - birth
 			$('#years').val(res);
 			if($(this).val() == ''){
 				$('#years').val('');
 			}
 			}
 		});
	  
	 //주소 팝업창 오픈
 		$('#addbtn').click(function goPopup(){
 			var pop = window.open("/choi/popup/jusoPopup.biz","pop","width=570,height=420, scrollbars=yes, resizable=yes");	
 				
 		});
	 
	 //salary event
 		var salary = find( "#salary" );
 		
	 $("#salary").on("keyup", function(event) {
		
		var selection = window.getSelection().toString();
	    if ( selection !== '' ) {
	        return;
	    }
		 var $this = $(this);
		 
		 var salary = $this.val();
		
		 var salary = salary.replace(/[\D\s\._\-]+/g, "");
		 
		 salary = salary ? parseInt( salary, 10 ) : 0;
		   
		 $this.val( function() {
		       return ( salary === 0 ) ? "" : salary.toLocaleString( "en-US" );
		    });
	 });
	

	
	//군필여부 면제 시 관련 input text 숨김
		$('#mil_yn').change(function(){
			if($('select[name=mil_yn]').val() == 'Y'){
				$('.mil').css('display','inline-block'); 
			} else {
				$('.mil').css('display','none');
			}	
		});
	
 		
 		
 		
	//자기소개 입력된 글 수 출력
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
<form name="form" id="form" method="post">
	

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
							<input type="file" id="file1" name="file1" class="mgl60"style="position: relative; top:-5px; left:50px; height:30px;">
				</div>
				<div class="mgl20 mgt40 mgb20">
					<label class="mgr40">입사구분</label>
					<select class="w250" name="join_type" id="join_type">
						<option></option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
				<div class="mgl30 mgb20 mil">
					<label class="mgr60">군별</label>
					<select class="w250" name="mil_type" id="mil_type">
						<option >(선택)</option>
						<option value="01">육군</option>
						<option value="02">공군</option>
						<option value="03">해군</option>
						<option value="04">전경</option>
						<option value="05">의경</option>
					</select>
				</div>
				<div class="mgl10 mgb20">
					<label class="" style="margin-right:8px;">KOSA등록</label>
					<select class="w250 mgl30" name="kosa_reg_yn" id="kosa_reg_yn">
						<option></option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
				<div class="mgl10 mgb20">
					<label class="" style="margin-right:6px;">사업자번호</label>
					<input type="text" class="mgl30" name="cmp_reg_no" value=""   placeholder="예)123-12-12345" id="cmp_reg_no" maxlength="10">
				</div>
			</div> 
			
			<div class=" w3-quarter" style="width: 23%;">
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*사번</label>
					<input type="text" class="mgl50" name="sabun" value=""   disabled id="sabun">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*아이디</label>
					<input type="text" class="" name="id" value="" style=" margin-left: 35px; " id="id" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">전화번호</label>
					<input type="text" class="mgl30 tel" name="phone"  value=""  id="phone" maxlength="13">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">연령</label>
					<input type="text" class="mgl60" name="years" value="" id="years">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">주소</label>
					<input type="text" class="mgl60"  id="zip" name="zip" style="width:150px;  " placeholder="우편번호">
					<div class="w3-button w3-hover-white mgl20 w3-border w3-border-dark-grey w3-round w30" 
								style="height:7px; position: relative; top: -2px;" id="addbtn" >
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
						<option value="01">대학원</option>
						<option value="02">대학교</option>
						<option value="03">고등학교</option>
						<option value="04">검정고시</option>
					</select>
				</div>
				<div class=" mgb20 mil" >
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
					<select class="w250 mgl20" name="kosa_class_code" id="kosa_class_code">
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
					<input type="text" class="mgl30" value=""  id="name">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*패스워드</label>
					<input type="text" class="mgl30 sc"  value=""   id="pwd" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">*핸드폰번호</label>
					<input type="text" class="tel" value="" style="margin-left: 15px; " id="hp" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px; position: relative; left: -25px;">*이메일</label>
					<input type="text" class="" value="" style="width:110px;   position: relative; left: -25px;" id="email">
					<select style="height: 25px;" name="esite" id="esite">
						<option value="01">@naver.com</option>
						<option value="02">@daum.net</option>
						<option value="03">@gmail.com</option>
						<option value="04">@nate.com</option>
					</select>
				</div>
				<div class=" mgb20" style="position: relative; top: -2px;'">
					<input type="text" class="w400" id="addr1" name="addr1" style="  position: relative;  left: -35px;"  placeholder="주소">
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
					<select class="w250 mgl30" name="put_yn" id="put_yn">
						<option></option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
				<div class=" mgb10">
					<label class="mil" style="margin-right:8px;">입영일자</label>
					<input type="date" class="mgl30 h30 mil" id="mil_startdate" >
				</div>
				<div class=" mgb10">
					<label class="" style="margin-right:8px; position: relative; left: -10px;">*입사일자</label>
					<input type="date" class="mgl20" id="join_day">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px; position: relative; left:-15px;">사업자등록증</label>
					<input type="text" class="" name="cmp_reg_image" value=""   disabled id="cmp_reg_image">
				</div>
				<div class="">
					<label class="" style="margin-right:1px; ">이력서</label>
					<input type="text" class="mgl50" name="carrier" value=""   disabled id="carrier">
				</div>
			</div>
			
			<div class=" w3-quarter " style="width: 23%;">
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">영문성명</label>
					<input type="text" class="mgl30" value=""  id="eng_name">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px; position: relative; left: -25px;">*패스워드 확인</label>
					<input type="text" class="sc"  value="" style=" position: relative; left: -15px; " id="pwd2" >
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:6px;">주민번호</label>
					<input type="text" class="mgl30 sc" value=""  id="reg_no" maxlength="14">
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
						<option value="M">남성</option>
						<option value="F">여성</option>
						
					</select>
				</div>
				<div class=" mgb20" style="position: relative; top: -3px;'">
					<input type="text" class="w350" id="addr2" name="addr2" placeholder="상세주소">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:8px; position: relative; left: -8px;">연봉(만원)</label>
					<input type="text" class="right w3-text-grey mgl20 " id="salary" value=""  placeholder="(만원)"
								style="position: relative; left: -4px;" maxlength="10">
				</div>
				<div class=" mgb20">
					<label class="" style="margin-right:8px;">군필여부</label>
					<select class="w250 mgl30" name="mil_yn" id="mil_yn">
						<option></option>
						<option value="Y">군필</option>
						<option value="N">면제</option>
					</select>
				</div>
				<div class="mgb10 mil">
					<label class="" style="margin-right:8px;">전역일자</label>
					<input type="date" class="mgl30 h30 mil" id="mil_enddate">
				</div>
				<div class=" mgb10">
					<label class="" style="margin-right:8px; position: relative; left: -10px;">*퇴사일자</label>
					<input type="date" class="mgl20" id="retire_day">
				</div>
				
				<div class=" mgb10">
					<div class="w3-button w3-hover-white w3-border w3-border-dark-grey w3-round btn" 
								style="height:7px; position: relative; top: -2px;" id="bogi">
						<div class="mgl20" style="position: relative; top: -8px; left: -10px;"><small>미리보기</small></div>
					</div>
					<input type="file" id="file" name="file" style="position: relative; top:; height:40px;" class="">
				</div>
				<div class=" mgb10">
					<div class="w3-button w3-hover-white w3-border w3-border-dark-grey w3-round btn" 
								style="height:7px; position: relative; top: -2px;" id="bogi">
						<div class="mgl20" style="position: relative; top: -8px; left: -10px;"><small>미리보기</small></div>
					</div>
					<input type="file" id="file" name="file" style="position: relative; top:; height:40px;" class="">
				</div>
			</div>
			<div class="inblock" style="position: relative; top: -20px;">
				<label class="mgl30" style="position: relative; top:-50px;">자기소개</label>
				<label class="w3-text-grey  "id="self_intro_cnt" style="position: relative; top:-30px; left: -63px; font-size: 9pt;">(0 / 100) </label> 
				<textarea name="self_intro" cols="69" id="self_intro" style="resize: vertical; height:60px; position: relative; left: -10px;"
								placeholder="100자 내외로 적으시오." maxlength="100"></textarea>
			</div>
			
		</div>
	</div>
</div>
</form>
</body>
</html>