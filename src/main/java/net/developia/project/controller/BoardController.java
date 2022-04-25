package net.developia.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.crypto.Mac;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mock.http.MockHttpOutputMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import net.developia.project.dto.BoardDTO;
import net.developia.project.service.BoardService;

@Log4j
@Controller
@RequestMapping("board/{pg}")
public class BoardController {

	private BoardService boardService;
	
	@Value("${pageSize}")
	private long pageSize;
	
	@Value("${blockSize}")
	private long blockSize;
	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@GetMapping("insert")
	public String insertBoard() {
		return "board.insert";
	}	
	
	@PostMapping("insert")
	public String insertBoard(@ModelAttribute BoardDTO boardDTO,
		Model model) throws IllegalStateException, IOException {
		String filename= null;
		MultipartFile uploadFile = boardDTO.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName= uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			
			UUID uuid = UUID.randomUUID();
			filename=uuid+"."+ext;
			System.out.println("fileName : "+filename);
			uploadFile.transferTo(new File("/Users/chagyeongjun/Desktop/temp/"+filename));
			System.out.println("filePath :  "+"/Users/chagyeongjun/Desktop/temp/"+filename);
		}
		log.info(boardDTO.toString());
		try {
			boardDTO.setFileName(filename);
			boardService.insertBoard(boardDTO);
			return "redirect:../1/";
		} catch (Exception e) {
			model.addAttribute("msg", "입력 에러");
			model.addAttribute("url", "javascript:history.back();");
			return "result";
		}
	}
	
	@GetMapping("/")
	public String list(@PathVariable long pg, 
		Model model) throws Exception {
		
		try {
			long recordCount = boardService.getBoardCount();
			long pageCount = recordCount / pageSize;
			if (recordCount % pageSize != 0) pageCount++;
			
			List<BoardDTO> list = boardService.getBoardListPage(pg);

			long startPage = (pg - 1)/blockSize*blockSize+1;
			long endPage   = startPage + blockSize - 1;
			if (endPage > pageCount) endPage = pageCount;
			
			model.addAttribute("list", list);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pg", pg);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("recordCount", recordCount);
			model.addAttribute("pageSize", pageSize);
			return "board.list";
		} catch (Exception e) {
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "index");
			return "result";
		}
	}

	@PostMapping("/param") //name 전달 받고 post 방식으로 전달 
	public ModelAndView param 
	(@RequestParam String name) {
		log.info("name : " + name);
		return null;
		
		
	}
	

	@GetMapping("searchForm")
	@ResponseBody
	private ModelAndView getSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword, Model model,@PathVariable long pg) throws Exception{
		System.out.println("search controller 수행");
	
		log.info("type :"+type);
		log.info("keyword :" +keyword);
		BoardDTO boardDTO = new BoardDTO();

		boardDTO.setType(type);
		boardDTO.setKeyword(keyword);
		List<BoardDTO> list = boardService.getSearchList(boardDTO);
		
		ModelAndView mav = new ModelAndView();
	    Map<String,Object> map = new HashMap<>();

	    long recordCount = boardService.getBoardCount();
		long pageCount = recordCount / pageSize;
		if (recordCount % pageSize != 0) pageCount++;
		long startPage = (pg - 1)/blockSize*blockSize+1;
		long endPage   = startPage + blockSize - 1;
		if (endPage > pageCount) endPage = pageCount;
	    
	    
	    map.put("list",list);
	    map.put("type", type);
	    map.put("keyword", keyword);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pg", pg);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("recordCount", recordCount);
		model.addAttribute("pageSize", pageSize);
	    
	    mav.addObject("list", list);
	    mav.addObject("keyword", keyword);
	    mav.addObject("type", type);
	    mav.setViewName("board/searchForm"); 
	    System.out.println("map : "+ map);
	    
		return mav;	
	
	}
	
}