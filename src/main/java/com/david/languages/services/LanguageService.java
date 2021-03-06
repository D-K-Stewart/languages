package com.david.languages.services;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.david.languages.models.Language;
import com.david.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
private final LanguageRepository languageRepository;
    
    public LanguageService(LanguageRepository languageRepository) {
        this.languageRepository = languageRepository;
    }
    // returns all the books
    public List<Language> allLanguages() {
        return languageRepository.findAll();
    }
    // creates a book
    public Language createLanguage(Language b) {
        return languageRepository.save(b);
    }
    // retrieves a book
    public Language findLanguage(Long id) {
        Optional<Language> optionalLanguage = languageRepository.findById(id);
        if(optionalLanguage.isPresent()) {
            return optionalLanguage.get();
        } else {
            return null;
        }
    }
    
    public Language updateLanguage(Long id, String name, String creator, double version) {
						
    	Language foundLanguage = findLanguage(id);
    	foundLanguage.setName(name);
    	foundLanguage.setCreator(creator);
    	foundLanguage.setVersion(version);
  
    	return languageRepository.save(foundLanguage);

    }
    
    public void deleteLanguage(Long id) {
    	languageRepository.deleteById(id);
    }



}


