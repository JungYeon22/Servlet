$(function(){
	$.ajax({
		type: 'post'
		, url: '/projectMVC/board/getBoard.do'
		, data: 'seq='+$('#seq').val()
		, dataType: 'json'
		, success: function(data){
			console.log(JSON.stringify(data))
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#idSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			//자기가 작성한 글이면 수정,삭제기능 $('#boardViewSpan')
			if($('#memId').val() != data.id){
				$('#boardViewSpan').remove();
			}
		}
		, error: function(e){
			console.log(e)
		}
	});
});


//글 수정 - 수정한 페이지번호를 보여준다.
$('#boardUpdateFormBtn').click(function(){
		var pg = $('#pg').val();
		location.href='/projectMVC/board/boardUpdateForm.do?pg='+pg+'&seq='+data.seq	
})
// 글 삭제 - 삭제한 후에는 1페이지를 보여준다.
$('#boardDeleteBtn').click(function(){
	$('#boardViewForm').attr('action', '/projectMVC/board/boardDelete.do');
	$('#boardViewForm').submit();	//seq, pg
});

// 답글 - 원글이 있는 페이지번호를 보여준다.
$('#boardReplyFormBtn').click(function(){
	$('#boardViewForm').attr('action', '/projectMVC/board/boardReplyForm.do');
	$('#boardViewForm').submit();	//seq, pg
});