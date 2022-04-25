package net.developia.project.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.developia.project.dto.AttachFileDTO;
import net.developia.project.dto.BoardDTO;
import net.developia.project.dto.ReplyVO;
import net.developia.project.service.BoardService;
import net.developia.project.service.ReplyService;

@Log4j
@Controller
@RequestMapping("board/{pg}/{no}")
public class BoardDetailController {

	private BoardService boardService;
	private ReplyService replyService;
	public BoardDetailController(BoardService boardService , ReplyService replyService) {
		this.boardService = boardService;
		this.replyService = replyService;
	}

	@GetMapping(value = "/") // /board/1/pg/no/
	public String detail(
			@PathVariable long pg,
			@PathVariable long no,
			//@RequestParam long vn, // virtual number
			@ModelAttribute ("replyVO") @Valid ReplyVO replyVO,
			Model model) throws Exception {
		
		try {
			BoardDTO boardDTO = boardService.getDetail(no);
			model.addAttribute("boardDTO", boardDTO);
		
			return "board.detail";
		} catch(RuntimeException e) { 
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "../");
			return "result";
		} catch (Exception e) {
			model.addAttribute("msg", "상세보기 에러");
			model.addAttribute("url", "../");
			return "result";
		}
	}
	
//	@RequestMapping(value = "/getReqlyList", method = RequestMethod.POST)
//
//	public List<ReplyVO> getReplyList(@RequestParam("bid") int bid) throws Exception {
//		
//		ReplyVO vo = new ReplyVO();
//		vo.setBid(bid);
//		
//		return boardService.getReplyList(bid);
//
//	}

	

	
	
	@GetMapping("delete")
	public String delete(@PathVariable long no, Model model) {
		return "board.delete";
	}
	
	@PostMapping("delete")
	public ModelAndView delete(@ModelAttribute BoardDTO boardDTO) {
		log.info(boardDTO.toString());
		ModelAndView mav = new ModelAndView("result");
		try {
			boardService.deleteBoard(boardDTO);
			mav.addObject("msg", boardDTO.getNo() + "번 게시물이 삭제되었습니다.");
			mav.addObject("url", "../../1/");
		} catch (Exception e) {
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "javascript:history.back();");
		}
		return mav;
	}
	
	@GetMapping("update")
	public String update(@PathVariable long no, Model model) {
		try {
			BoardDTO boardDTO = boardService.getDetail(no);
			model.addAttribute("boardDTO", boardDTO);
			return "board.update";
		} catch (Exception e) {
			model.addAttribute("msg", "해당하는 게시물이 없거나 시스템 에러입니다.");
			model.addAttribute("url", "../../1/");
			return "result";
		}
	}
	
	@PostMapping("update")
	public String updateBoard(@ModelAttribute BoardDTO boardDTO,
		Model model) {
		
		log.info(boardDTO.toString());
		try {
			boardService.updateBoard(boardDTO);
			model.addAttribute("msg", boardDTO.getNo() + "번 게시물이 수정되었습니다.");
			model.addAttribute("url", "./");
			return "result";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			model.addAttribute("url", "javascript:history.back();");
			
			return "result";
		}
	}
	
	@GetMapping(value = "download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		log.info("download file: " + fileName);
		Resource resource = new FileSystemResource("/Users/chagyeongjun/Desktop/temp/" + fileName);
		
		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		log.info("resource: " + resource);
		
		String resourceName = resource.getFilename();
		
		// remove UUID
//		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		try {
			String downloadName = null;
			
			if (userAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("/", " ");
			} else 
			if (userAgent.contains("Edge")) {
				log.info("Edge Browser");
				downloadName = URLEncoder.encode(resourceName, "UTF-8");
			} else {
				log.info("Chrome Browser");
				downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
			}
			log.info("downloadName" + downloadName);
			headers.add("Content-Disposition",
					"attachment; filename=" + downloadName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		
	}
	
	
}