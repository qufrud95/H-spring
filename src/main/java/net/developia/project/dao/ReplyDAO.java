package net.developia.project.dao;

import java.util.List;

import net.developia.project.dto.ReplyVO;

public interface ReplyDAO {

	public int insert(ReplyVO vo) throws Exception;
	
	public ReplyVO read (Long rno) throws Exception;
	
	public int delete (Long rno) throws Exception;
	
	public int update (ReplyVO vo)throws Exception;
	
	public List<ReplyVO> getList(Long rno)throws Exception;


}
