package com.edu.board.service;

import java.util.List;

import com.edu.board.dto.BoardDTO;
import com.edu.common.util.SearchCriteria;

public interface BoardService {
	
	//-----------------------------------------------------------------------------------------------------------
	// 게시글 목록 보여주기
	//-----------------------------------------------------------------------------------------------------------
	public List<BoardDTO> boardList(SearchCriteria sCri) throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 전체 게시글 수 가져오기 
	//-----------------------------------------------------------------------------------------------------------	
	public int boardListTotalCount(SearchCriteria sCri) throws Exception;
	
}
