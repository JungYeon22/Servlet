
function checkWrite(){		
	document.getElementById("checkName").innerText = "";
	document.getElementById("checkId").innerText = "";
	document.getElementById("checkPwd").innerText = "";
	document.getElementById("checkRepwd").innerText = "";
			if(document.writeForm.name.value == ""){
				document.getElementById("checkName").innerHTML = "이름을 입력해주세요."
			}
			else if(document.writeForm.id.value == ""){
				$('#checkId').text("아이디를 입력해주세요.");
			}
			else if(document.writeForm.pwd.value == ""){
				document.getElementById("checkPwd").innerHTML = "비밀번호를 입력해주세요."
			}
			else if(document.writeForm.pwd.value != document.writeForm.repwd.value){
				$('#checkRepwd').text("비밀번호를 확인해주세요.");
			}else{
				$.ajax({
					type: 'post'
					, url: '/projectMVC/member/write.do'
					, data: $('#writeForm').serialize() //name=홍길동&id=hong&pwd~~~
					, dataType: 'text'
					, success: function(data){
						data = data.trim();
						if(data == "1"){
							alert('회원가입 되었습니다.');
							location.href='/projectMVC/index.jsp'
						}else{
							alert('회원가입에 실패하였습니다.');
							location.reload();
						}
					}
					, error: function(e){
						console.log(e);
					}
				})
			}
	}
function changeEmail2(){
		var selectedValue = document.getElementById("emails").value;
		if(selectedValue == ""){
			document.getElementById("email2").value = "";
		}else {
			document.getElementById("email2").value = selectedValue;
		}
	}
	

function checkPost(){
	 new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
 }

















