package net.developia.project.dao;

import java.util.List;

import net.developia.project.dto.ItemDTO;

public interface AutocompleteDAO {

	List<ItemDTO> getWords(String term) throws Exception;
	
}
