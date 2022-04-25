package net.developia.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.developia.project.dao.AutocompleteDAO;
import net.developia.project.dto.ItemDTO;

@Service
public class AutocompleteServiceImpl implements AutocompleteService {
	
	@Autowired
	private AutocompleteDAO autocompleteDAO;

	@Override
	public List<ItemDTO> getWords(String term) throws Exception {
		return autocompleteDAO.getWords(term);
	}
}
