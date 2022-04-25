package net.developia.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.developia.project.dto.BoardDTO;
import net.developia.project.dto.Criteria;
import net.developia.project.dto.ReplyVO;

public interface BoardDAO {

	void insertBoard(BoardDTO boardDTO) throws Exception;

	List<BoardDTO> getBoardList() throws Exception;

	BoardDTO getDetail(long no) throws Exception;

	void updateReadcount(long no) throws Exception ;

	int deleteBoard(BoardDTO boardDTO) throws Exception ;

	int updateBoard(BoardDTO boardDTO);
	
	int getTotal();
	//
	List<BoardDTO> getListPaging(Criteria cri) throws Exception;

	List<BoardDTO> getBoardListPage(@Param("startNum") long startNum, @Param("endNum") long endNum);
	
	long getBoardCount() throws Exception ;

	List<BoardDTO> selectSearchList(BoardDTO boardDTO);
	
	
	/* 댓글 */
	public List<ReplyVO> getReplyList(int bid) throws Exception;

	

	public int saveReply(ReplyVO replyVO) throws Exception;

	

	public int updateReply(ReplyVO replyVO) throws Exception;

	

	public int deleteReply(int rid) throws Exception;



	
	
	
	
	
	
}