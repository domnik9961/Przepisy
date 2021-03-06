package com.przepisy.przepisy.auth.web;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.przepisy.przepisy.auth.model.Recipe;
import com.przepisy.przepisy.auth.model.User;
import com.przepisy.przepisy.auth.service.RecipeService;
import com.przepisy.przepisy.auth.service.SecurityService;
import com.przepisy.przepisy.auth.service.UserService;
import com.przepisy.przepisy.auth.validator.UserValidator;

@Controller
public class AdminController {
    @Autowired
    
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    @Autowired
    private RecipeService recipeService;


    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("recipeIdForm", new Recipe());
    	model.addAttribute("recipeList", recipeService.getAllRecipies());

        return "admin";
    }
        
    @PostMapping("/admin/{id}")
    public String adminDeleteId(@ModelAttribute("recipeIdForm") Recipe recipeToDelete,@PathVariable Long id,  Model model) {
    	recipeService.deleteById(id);
        return "redirect:/admin";
    }
}
