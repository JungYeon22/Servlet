
function checkWrite(){		
	document.getElementById("checkName").innerText = "";
	document.getElementById("checkId").innerText = "";
	document.getElementById("checkPwd").innerText = "";
	document.getElementById("checkRepwd").innerText = "";
			if(document.writeForm.name.value == ""){
				document.getElementById("checkName").innerHTML = "이름을 입력해주세요."
			}
			else if(document.writeForm.id.value == ""){
				document.getElementById("checkId").innerHTML = "아이디를 입력해주세요."
			}
			else if(document.writeForm.pwd.value == ""){
				document.getElementById("checkPwd").innerHTML = "비밀번호를 입력해주세요."
			}
			else if(document.writeForm.pwd.value != document.writeForm.repwd.value){
				document.getElementById("checkRepwd").innerHTML = "비밀번호를 확인해주세요."
			}
			else if(document.getElementById("id").value != document.getElementById("check").value){
				document.getElementById("checkId").innerHTML = "중복 체크하세요."
			}else{
				document.writeForm.submit();
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

function checkId(){
	var id = document.getElementById("id").value;
	if(id == "") alert("ID를 입력해주세요.");
	else window.open("http://localhost:8080/projectJSP/member/checkId.jsp?id="+id
						, "checkId"
						, "width=450 height=350 left=300 top 150");
}















