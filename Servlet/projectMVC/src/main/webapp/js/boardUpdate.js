$(function(){
	$.ajax({
		type: 'post'
		, url: '/projectMVC/board/getBoard.do'
		, data: 'seq='+$('#seq').val()
		, dataType: 'json'
		, success: function(data){
			console.log(JSON.stringify(data))
			
			$('#subject').val(data.subject);
			$('#logtime').val(data.logtime);
			$('#content').val(data.content);
		}
		, error: function(e){
			console.log(e)
		}
	});
})

 $('#boardUpdateBtn').click(function(){
    	   $('#checkSubject').empty();
    	   $('#checkContent').empty();
    	   if($('#subject').val()==''){
    		   $('#checkSubject').html('제목을 입력해주세');
    	   }else if($('#content').val()==''){
    		   $('#checkContent').html('내용을 입력해주세요');
    	   }else {
    		   $.ajax({
    			   type: 'post'
    			   , url: '/projectMVC/board/boardUpdate.do'
    			   , data: {'subject': $('#subject').val()
    				   		, 'content': $('#content').val()
    				   		, 'seq': $('#seq').val()}
    			   , dataType: 'text'
    			   , success: function(data){
    				   data = data.trim();
    				   console.log(data);
    				   if(data != "1"){
    					   alert('게시글 등록에 실패하였습니다.')
    				   }
    				   else {
						   alert('게시글이 수정되었습니다.')
						   location.href='/projectMVC/board/boardList.do?pg='+$('#pg').val();
					   }
    				   
    			   }
    			   , error: function(e){
    				   console.log(e)
    			   }
    		   }) 
    	   }
       })