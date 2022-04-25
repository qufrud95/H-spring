//package net.developia.project.dao;
//
//import java.util.List;
//import java.util.stream.IntStream;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import lombok.Setter;
//import lombok.extern.log4j.Log4j;
//import net.developia.project.dto.ReplyVO;
//@RunWith(SpringRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@Log4j
//public class ReplyMapperTests {
//	
//	private Long[] bnoArr = { 34145745L};
//	
//	@Setter(onMethod_ = @Autowired)
//	private ReplyDAO replyDAO;
//	
//
//	
//	@Test
//	public void testCreate() {
//		
//		IntStream.rangeClosed(1, 10).forEach(i	->{
//			
//			ReplyVO vo = new ReplyVO();
//			
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글 테스트 : "+i);
//			vo.setReply("replyer : "+i);
//			
//			//replyDAO.insert(vo);
//			
//		
//		});
//	}
//	
//	@Test
//	public void testMapper() {
//		
//		log.info(replyDAO);
//	}
//	@Test
//	public void testRead() throws Exception {
//		
//		
//		Long targetRno = 2L;
//		ReplyVO vo = replyDAO.read(targetRno);
//		
//		log.info(vo);
//		
//	}
//	
//	@Test
//	public void testDelete() throws Exception {
//		
//		Long targetRno = 1L;
//		replyDAO.delete(targetRno);
//		
//	}
//	@Test
//	public void testList() {
////		
////		List<ReplyVO> replies = replyDAO.getList(b)
//		
//	}
//}
