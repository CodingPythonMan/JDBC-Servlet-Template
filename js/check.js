function checkForm(f){
	var rid = /[^a-zA-Z0-9_]/g; 
	//영문자와 _와 숫자를 제외한 모든 문자
	
	var rname = /[가-힣a-zA-Z]/;
	//가-힣, 영문자까지 검사
	
	var rkorean = /[가-힣]/;
	var renglish = /[a-zA-Z]/;
	
	// 아이디 정규표현식 검사
	// 3글자 이상 검사
	user_id = f.id.value;
	if (user_id.length < 3) {
		alert("아이디는 3자 이상으로 입력되어야 합니다.");
		f.id.value = "";
		f.id.focus();
		return false;
	}
		
	// 영문자, 숫자 검사
	if (user_id.search(rid) >= 0) {
		alert("아이디는 영문자, 숫자, _로 구성되어야 합니다.");
		f.id.value = "";
		f.id.focus();
		return false;
	}
	
	// 비밀번호 12자 이상 검사
	user_pw = f.password.value;
	if (user_pw.length < 12) {
		alert("비밀번호는 12자 이상으로 입력되어야 합니다.");
		f.password.value = "";
		f.password.focus();
		return false;
	}
	
	// 비밀번호 확인 정규표현식 검사
	user_pwcheck = f.passwordCheck.value;
	if (!(user_pw === user_pwcheck)) {
		alert("비밀번호와 똑같이 입력해주십시오.");
		f.passwordCheck.value = "";
		f.passwordCheck.focus();
		return false;
	}
	
	// 이름 정규표현식 검사
	// 공백없이 한글,영문만 입력 가능
	user_name = f.name.value;
	nameCheck = false;
	if(user_name.match(/\s/g)){
		alert("이름에 공백이 존재합니다.");
		f.name.value = "";
		f.name.focus();
		return false;
	}
	if (!rname.test(user_name)) {
		alert("이름은 한글, 영어만 가능합니다.");
		f.name.value = "";
		f.name.focus();
		return false;
	}
	if(rkorean.test(user_name)){
		if(user_name.length < 2){
			alert("이름은 한글 2자 이상 가능입니다.");
			f.name.value = "";
			f.name.focus();
			return false;
		}			
	}
	if(renglish.test(user_name)){
		if(user_name.length < 4){
			alert("이름은 영문 4자 이상 가능입니다.");
			f.name.value = "";
			f.name.focus();
			return false;
		}	
	}
	
	// 라디오버튼 가입경로 검사
	routeCheck = false;
	for(var i=0; i<f.route.length; i++){
		if(f.route[i].checked){
			routeCheck = true;
			break;
		}
	}
	
	if(!routeCheck){
		alert("가입경로를 선택해 주세요.");
		return false;
	}

	// 캡처
	captcha = f.captcha.value;
	if (!(captcha === "captcha")) {
		alert("자동등록방지 문자가 틀렸습니다.");
		f.captcha.value = "";
		f.captcha.focus();
		return false;
	}
}