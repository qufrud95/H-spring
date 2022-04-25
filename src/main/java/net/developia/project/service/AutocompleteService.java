package net.developia.project.service;

import java.util.List;

import net.developia.project.dto.ItemDTO;

public interface AutocompleteService {

	List<ItemDTO> getWords(String term) throws Exception;

}
