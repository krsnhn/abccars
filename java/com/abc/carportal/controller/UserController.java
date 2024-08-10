package com.abc.carportal.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abc.carportal.entity.Role;
import com.abc.carportal.entity.User;
import com.abc.carportal.service.UserServiceNasad;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    private final UserServiceNasad userService;

    @Autowired
    public UserController(UserServiceNasad userService) {
        this.userService = userService;
    }
    

    @GetMapping("/users")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String viewUsers(Model model) {
        List<User> users = userService.listAll();
        model.addAttribute("userlists", users);
        return "all_user";
    }
    
    @GetMapping("/profile")
    public String viewProfile(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        User user = userService.findByUserName(username);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/editProfile")
    public String editProfile(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        User user = userService.findByUserName(username);
        model.addAttribute("user", user);
        return "edit_profile";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute("user") User user, HttpSession session, Model model) {
        // Check if email already exists
        if (userService.existsByEmail(user.getEmail())) {
            model.addAttribute("emailError", "Email already exists.");
            return "edit_profile"; // Assuming "edit_profile" is your edit profile form view
        }
        
        // Check if username already exists
        if (userService.existsByUsername(user.getUsername())) {
            model.addAttribute("usernameError", "Username already exists.");
            return "edit_profile"; // Assuming "edit_profile" is your edit profile form view
        }
        
     // Set role id to 2
        Role role = new Role();
        role.setId(2L);

        // Add the role to the user's roles
        Set<Role> roles = new HashSet<>();
        roles.add(role);
        user.setRoles(roles);

        // If no errors, update the profile
        userService.saveUser(user);
        
        // Update the session with the new username
        session.setAttribute("username", user.getUsername());
        
        return "redirect:/profile";
    }

}


    
