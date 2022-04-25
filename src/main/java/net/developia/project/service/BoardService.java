package net.developia.project.service;

import java.util.List;

import net.developia.project.dto.BoardDTO;
import net.developia.project.dto.ReplyVO;

public interface BoardService {

	void insertBoard(BoardDTO boardDTO) throws Exception;

	List<BoardDTO> getBoardList() throws Exception;

	BoardDTO getDetail(long no) throws Exception;

	void deleteBoard(BoardDTO boardDTO) throws Exception;

	void updateBoard(BoardDTO boardDTO) throws Exception;

	List<BoardDTO> getBoardListPage(long pg) throws Exception;

	long getBoardCount() throws Exception;

	List<BoardDTO> getSearchList(BoardDTO boardDTO) throws Exception;// 검색 
	
	// 댓글
	public List<ReplyVO> getReplyList(int bid) throws Exception;

	

	public int saveReply(ReplyVO replyVO) throws Exception;

	

	public int updateReply(ReplyVO replyVO) throws Exception;

	

	public int deleteReply(int rid) throws Exception;


}