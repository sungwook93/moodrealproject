//관리자 페이지 메뉴
$(document).ready(function() {
	
	//처음 페이지들어갈시 상품관리메뉴만보이게
	$("#admintitle2").css("display", "none");
	$("#admintitle3").css("display", "none");
	
	//처음 페이지들어갈시 상품관리테이블만 보이게
	$("#admintable2").css("display", "none");
	$("#admintable3").css("display", "none");
	
	
	$("#adminarea").css("text-align", "center");
	
	//메뉴 클릭시 보이는 페이지내용
	$("#titlesection1").click(function() {
		$("#admintitle").css("display", "none");
		$("#admintitle2").css("display", "none");
		$("#admintitle3").css("display", "inline-block");
		$("#admintable").css("display", "none");
		$("#admintable2").css("display", "none");
		$("#admintable3").css("display", "inline-block");
	});	
	$("#titlesection2").click(function() {
		$("#admintitle").css("display", "inline-block");
		$("#admintitle2").css("display", "none");
		$("#admintitle3").css("display", "none");
		$("#admintable").css("display", "inline-block");
		$("#admintable2").css("display", "none");
		$("#admintable3").css("display", "none");
	});	
	$("#titlesection3").click(function() {
		$("#admintitle").css("display", "none");
		$("#admintitle2").css("display", "inline-block");
		$("#admintitle3").css("display", "none");
		$("#admintable").css("display", "none");
		$("#admintable2").css("display", "inline-block");
		$("#admintable3").css("display", "none");
	});
	$("#titlesection4").click(function() {
		$("#admintitle").css("display", "inline-block");
		$("#admintitle2").css("display", "none");
		$("#admintitle3").css("display", "none");
		$("#admintable").css("display", "inline-block");
		$("#admintable2").css("display", "none");
		$("#admintable3").css("display", "none");
	});	
	$("#titlesection5").click(function() {
		$("#admintitle").css("display", "none");
		$("#admintitle2").css("display", "inline-block");
		$("#admintitle3").css("display", "none");
		$("#admintable").css("display", "none");
		$("#admintable2").css("display", "inline-block");
		$("#admintable3").css("display", "none");
	});	
	$("#titlesection6").click(function() {
		$("#admintitle").css("display", "none");
		$("#admintitle2").css("display", "none");
		$("#admintitle3").css("display", "inline-block");
		$("#admintable").css("display", "none");
		$("#admintable2").css("display", "none");
		$("#admintable3").css("display", "inline-block");
	});	
	$("#titlesection7").click(function() {
		$("#admintitle").css("display", "none");
		$("#admintitle2").css("display", "inline-block");
		$("#admintitle3").css("display", "none");
		$("#admintable").css("display", "none");
		$("#admintable2").css("display", "inline-block");
		$("#admintable3").css("display", "none");
	});	
	$("#titlesection8").click(function() {
		$("#admintitle").css("display", "none");
		$("#admintitle2").css("display", "none");
		$("#admintitle3").css("display", "inline-block");
		$("#admintable").css("display", "none");
		$("#admintable2").css("display", "none");
		$("#admintable3").css("display", "inline-block");
	});	
	$("#titlesection9").click(function() {
		$("#admintitle").css("display", "inline-block");
		$("#admintitle2").css("display", "none");
		$("#admintitle3").css("display", "none");
		$("#admintable").css("display", "inline-block");
		$("#admintable2").css("display", "none");
		$("#admintable3").css("display", "none");
	});		
});

// listMembers 회원 정보를 삭제하기 전에 삭제 여부를 확인한다.
function fn_removeMember(userID) {
	// alert("삭제할 회원 아이디 : " + userID);
	// confirm("삭제할 회원 아이디 : " + userID);
	
	if(!confirm("회원 정보를 삭제하시겠습니까?\n\n삭제를 하시려면 [확인]버튼을 누리시고, 아니면 [취소]버튼을 누르십시오!")) {
		alert("회원 정보 삭제를 취소하셨습니다.");
	} else { // 삭제를 동의하면 삭제에 대한 url요청을 한다.
		alert("회원 정보를 삭제합니다.");
		location.href = "/member/removeMember.do?userID="+ userID;
	}
}
