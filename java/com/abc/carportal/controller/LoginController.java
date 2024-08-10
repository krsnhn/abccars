package com.abc.carportal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.carportal.entity.User;
import com.abc.carportal.service.UserServiceNasad;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserServiceNasad userService;

    @GetMapping("/loginform")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@ModelAttribute("user") User user, HttpSession session, RedirectAttributes redirectAttributes) {
        User authenticatedUser = userService.findByUserNameAndPassword(user.getUsername(), user.getPassword());
        if (authenticatedUser != null) {
            // Capture the ID of the authenticated user
            long userId = authenticatedUser.getId();
            
            // Store user ID in session
            session.setAttribute("userId", userId);
            
            return "redirect:/cars";  // Redirect to the cars page after successful login
        } else {
            redirectAttributes.addAttribute("loginError", "Invalid username or password.");
            return "redirect:/loginform"; // Redirect to the login form with error message
        }
    }
    



    
    
}