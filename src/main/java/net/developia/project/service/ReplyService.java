package net.developia.project.service;

import java.util.List;


import net.developia.project.dto.ReplyVO;

public interface ReplyService {
	
	public int insert(ReplyVO vo) throws Exception;
	
	public ReplyVO read (Long rno) throws Exception;
	
	public int delete (Long rno) throws Exception;
	
	public int update (ReplyVO vo)throws Exception;
	
	public List<ReplyVO> getList(Long rno)throws Exception;

}
