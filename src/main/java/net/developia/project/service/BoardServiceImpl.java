package net.developia.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.developia.project.dao.BoardDAO;
import net.developia.project.dao.ReplyDAO;
import net.developia.project.dto.BoardDTO;
import net.developia.project.dto.ReplyVO;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	private BoardDAO boardDAO;
	private ReplyDAO replyDAO;
	
	@Setter(onMethod_ = @Autowired )
	private ReplyDAO dao;

	@Value("${pageSize}")
	private int pageSize;


	public BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception {
		boardDAO.insertBoard(boardDTO);
	}
	
	@Override
	public List<BoardDTO> getBoardList() throws Exception {
		return boardDAO.getBoardList();
	}
	
	@Override
	public BoardDTO getDetail(long no) throws Exception {
		if (no == -1) {
			throw new RuntimeException("잘못된 접근입니다.");
		}
		boardDAO.updateReadcount(no);
		BoardDTO boardDTO = boardDAO.getDetail(no);
		if (boardDTO == null) {
			throw new RuntimeException(no + "번 글이 존재하지 않습니다.");
		}
		return boardDTO;
	}
	
	@Override
	public void deleteBoard(BoardDTO boardDTO) throws Exception {
		if(boardDAO.deleteBoard(boardDTO) == 0) {
			throw new RuntimeException(
				"해당하는 게시물이 없거나 비밀번호가 틀립니다.");
		}
	}
	
	@Override
	public void updateBoard(BoardDTO boardDTO) throws Exception {
		if(boardDAO.updateBoard(boardDTO) == 0) {
			throw new RuntimeException(
				"해당하는 게시물이 없거나 비밀번호가 틀립니다.");
		}
	}

	@Override
	public List<BoardDTO> getBoardListPage(long pg) throws Exception {
		long startNum = (pg - 1) * pageSize + 1;
		long endNum   = pg * pageSize;
	
		return boardDAO.getBoardListPage(startNum, endNum);
	}
	
	@Override
	public long getBoardCount() throws Exception {
		return boardDAO.getBoardCount();
	}

	@Override
	public List<BoardDTO> getSearchList(BoardDTO boardDTO) throws Exception{
		System.out.println("getSearchList Imple 수행 ");
		return boardDAO.selectSearchList(boardDTO);
	}
	
	
	// reply
	
	@Override

	public List<ReplyVO> getReplyList(int bid) throws Exception {

		return boardDAO.getReplyList(bid);

	}



	@Override

	public int saveReply(ReplyVO replyVO) throws Exception {

		return boardDAO.saveReply(replyVO);

	}



	@Override

	public int updateReply(ReplyVO replyVO) throws Exception {

		return boardDAO.updateReply(replyVO);

	}



	@Override

	public int deleteReply(int rid) throws Exception {

		return boardDAO.deleteReply(rid);

	}


	
}