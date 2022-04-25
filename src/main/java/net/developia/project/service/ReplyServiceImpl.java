package net.developia.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.developia.project.dao.ReplyDAO;
import net.developia.project.dto.ReplyVO;


@Log4j
@Service
public class ReplyServiceImpl  implements ReplyService{
	
	
	@Setter(onMethod_ = @Autowired )
	private ReplyDAO dao;
	
	@Override
	public int insert(ReplyVO vo) throws Exception {
		log.info("register .... "+vo);
		
		
		return dao.insert(vo);
	}

	@Override
	public ReplyVO read(Long rno) throws Exception {
		log.info("read .... "+rno);
		
		return dao.read(rno);
	}

	@Override
	public int delete(Long rno) throws Exception {
		
		log.info("delete .... "+rno);
		
		return dao.delete(rno);

	}

	@Override
	public int update(ReplyVO vo) throws Exception {
		log.info("read .... "+vo);
		
		return dao.update(vo);
	}

	@Override
	public List<ReplyVO> getList(Long rno) throws Exception {
	
		return dao.getList(rno);
	}

}
