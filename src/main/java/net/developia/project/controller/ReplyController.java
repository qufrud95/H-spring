package net.developia.project.controller;

import java.awt.PageAttributes.MediaType;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.developia.project.dto.ReplyVO;
import net.developia.project.service.BoardService;
import net.developia.project.service.ReplyService;

@RestController
@RequestMapping("board/{pg}/{no}")
public class ReplyController {
	
	private ReplyService replyService;
	
	@Value("${pageSize}")
	private long pageSize;
	
	@Value("${blockSize}")
	private long blockSize;
	
	public ReplyController(ReplyService replyService) {
		
		this.replyService = replyService;
	}
	
		
	@PostMapping(value = "/")
	public String insert(@ModelAttribute ReplyVO vo,Model model) {
		
		//replyService.insert(vo);
		return "result";

		
	}
		
		
		
	
}
