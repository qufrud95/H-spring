package net.developia.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;
import net.developia.project.dto.ItemDTO;
import net.developia.project.service.AutocompleteService;

@Log4j
@Controller
@RequestMapping("board/{pg}")
public class AutocompleteController {
	
	@Autowired // setter로 주입하는 방법, 생성자로도 주입하는것도 가능
	private AutocompleteService autocompleteService;
	
	@GetMapping("autocomplete")
	public String autocomplete() {
		return "autocomplete";
	}
	
	@GetMapping(value="autocomplete_data", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ItemDTO> autocomplete_data(@RequestParam String term) throws Exception {
		log.info("term : " + term);
		List<ItemDTO> list = autocompleteService.getWords(term);
		return list;
	}
}