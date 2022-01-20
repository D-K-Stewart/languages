package com.david.languages.controllers;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.david.languages.models.Language;
import com.david.languages.services.LanguageService;

@Controller
public class MainController {
	
	@Autowired
	LanguageService languageService;
	
	
	
	@RequestMapping("/")
		public String redirect() {
			return "redirect:/languages";
	}
	
	@RequestMapping("/languages")
    public String index(Model model, @ModelAttribute("language") Language language) {
        List<Language> languages = languageService.allLanguages();
        model.addAttribute("languages", languages);
        return "index.jsp";
	}
	
	
    @RequestMapping(value="/languages", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {
        
    	System.out.println(result);
    	
    	if (result.hasErrors()) {
            return "index.jsp";
        } else {
        	languageService.createLanguage(language);
            return "redirect:/languages";
        }
    }
    @RequestMapping("/languages/{id}/show")
    public String show(@PathVariable("id") Long id, Model model) {
    	Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);
        return "show.jsp";
    }
    
    
    @RequestMapping(value="/languages/{id}/edit", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("language") Language language, BindingResult result, @PathVariable("id") Long id, 
    		@RequestParam(value="name") String name, 
    		@RequestParam(value="creator") String creator, 
    		@RequestParam(value="version") double version) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
        	languageService.updateLanguage(id, name, creator, version);
            return "redirect:/languages";
        }
    }
      
    
    @RequestMapping("/languages/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
    	Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);
        return "edit.jsp";
    	}

    @RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
    	languageService.deleteLanguage(id);
    	return "redirect:/languages";
    }
   
}

