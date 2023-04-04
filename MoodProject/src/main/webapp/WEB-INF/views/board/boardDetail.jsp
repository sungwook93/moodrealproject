<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>게시글 상세 정보</title>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
			
		  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

			<link href="${contextPath}/resources/css/board.css" rel="stylesheet" type="text/css">
			<script src="${contextPath}/resources/js/board.js"></script>
		</head>
		<body>
			<!-- 상단 메뉴 -->
			<jsp:include page="../common/topMenu.jsp" flush="false"/>
			
			<hr/><br/>
			<h2 style = "text-align: center;">Q & A Detail</h2>
			<br/>
			<br/>
				
				<div class="container">
				<!-- 게시글 작성 부분 -->
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-1 control-label">제  목</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="qna_subject" name="qna_subject" maxlength="60" placeholder="제목 입력" value="${boardDTO.qna_subject}" readonly/>
						</div>
						<label class="col-sm-1 control-label">아이디</label>
						<div class="col-sm-3">
						<c:choose>
								<c:when test="${member1.grade == 7}">
									<input type="text" class="form-control" id="userID" name="userID" maxlength="20" value = "${boardDTO.userID }" readonly/>
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" id="userID" name="userID" maxlength="20" value = "${boardDTO.userID }" readonly/>
								</c:otherwise>
							</c:choose>
						</div>
					</div>	
					<div class="form-group">
						<label class="col-sm-1 control-label">내  용</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="qna_content" name="qna_content" readonly>${boardDTO.qna_content}</textarea>
						</div>
					</div>
				<br/>
				<div id="boardDetailBtn">
					<button type="button" class="btn btn-light" onclick="location.href='/board/boardList?page=1'">
						<span class="glyphicon glyphicon-list-alt"> 전체 목록 보기</span>
					</button>
					<!-- 작성자와 로그인한 사람의 아이디가 같거나 관리자일 때 나오는 부분 -->
					<c:choose>
						<c:when test="${boardDTO.userID == member1.userID or member1.grade == 7}">
							<button type="button" class="btn btn-light" onclick="location.href = '/board/boardUpdateForm?qna_bno=' + ${boardDTO.qna_bno}">
								<span class="glyphicon glyphicon-pencil"> 게시글 수정</span>
							</button>
							<button type="button" class="btn btn-light" onclick="fn_boardDelete(${boardDTO.qna_bno})">
								<span class="glyphicon glyphicon-trash"> 게시글 삭제</span>
							</button>
						</c:when>
					</c:choose>
				</div>
				<input type="hidden" id="qna_bno" value="${boardDTO.qna_bno}">
				<hr/>
				
				
				<!-- 댓글창 -->
				<table id="boardDetailCommentList">
					<!-- 등록된 댓글 보여주는 부분 -->
					<tr>
						<td class="comment15 commentLabel">
							<label>댓  글  목  록</label>
						</td>
						<!-- 내용 -->
						<!-- ${boardDTO.userID}는 게시글 작성자 아이디 /// ${member1.userID} 현재 회원 아이디 -->
						<td class="comment70">
							<table>
								<c:choose>
									<c:when test="${not empty commentList}">
										<c:forEach items="${commentList}" var="comment" varStatus="status">
											<tr>
												<td>
													<p>${status.count}</p>
													${comment.userID} &nbsp;:&nbsp;<input type = "text" id = "reply_content${status.count}" value = "${comment.reply_content}" style = "background-color: #d4c6bb; border: none; width: 500px;" readonly/>
													<c:if test="${member1.grade == 7 or member1.userID == comment.userID }">
														<a id="commentUpdateA" onclick="fn_updateOpen(${comment.reply_bno});"> 수정</a>
														<a id="commentUpdateB" style = "display:none;" onclick="fn_updateComment();"> 등록</a>
														<a id="commentDeleteA" onclick="fn_deleteComment(${comment.reply_bno}, ${boardDTO.qna_bno});"> x 삭제</a>
													</c:if>	
													<input type="hidden" id="reply_bno" value="${comment.reply_bno}"/>
													<input type="hidden" id="qna_bno" value="${comment.qna_bno}"/>
													<input type="hidden" id="userID1" value="${member1.userID}"/>
													<input type="hidden" id="statuscount" value="${status.count}"/>
												</td>
											</tr>
										</c:forEach>
									</c:when>	
									<c:otherwise>
										<tr>
											<td>등록된 댓글이 없습니다.</td>
										</tr>					
									</c:otherwise>
								</c:choose>
							</table>
						</td>
						<!-- 날짜 -->
						<td class="comment15">
							<table>
								<c:choose>
									<c:when test="${not empty commentList}">
										<c:forEach items="${commentList}" var="comment">
											<tr>
												<td>${comment.reply_regDate}</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</table>
						</td>
					</tr>
					<!-- 댓글 작성 부분(관리자만 오픈됨) -->
					<c:choose>
						<c:when test="${member1.grade == 7  or boardDTO.userID == member1.userID}">
							<tr>
								<td class="comment15 commentLabel">
									<label>댓  글  작  성</label>
								</td>
								<td class="comment70">
									${member1.userID}<textarea rows="3" cols="110" id="reply_content" placeholder="댓글 입력"></textarea>
								</td>
								<td class="commentButton">
									<button style="position:relative; left:25%; background-color: white; color: black; border-radius:5px; padding:5px; font-size:1.0em;" type="button" class="btn-light" type="button" onclick="fn_commentRegister(${boardDTO.qna_bno});">등 록</button>
								</td>
							</tr>
							<input type="hidden" id="userID1" value="${member1.userID}"/>
						</c:when>
					</c:choose>
				</table>
			</div>
			
			<jsp:include page="../common/footer.jsp" flush="false"/>
		
		</body>
		<script>
		$('#qna_content').summernote({
			disableResizeEditor: true,
			height: 300, 
		});
		
		$('#qna_content').summernote('disable');
		
		</script>
		
	</html>






