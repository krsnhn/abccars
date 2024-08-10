package com.abc.carportal.controller;

import com.abc.carportal.entity.Role;
import com.abc.carportal.entity.User;
import com.abc.carportal.service.UserServiceNasad;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import java.util.HashSet;
import java.util.Set;

@Controller
public class RegistrationController {

    @Autowired
    private final UserServiceNasad userService;

    @Autowired
    public RegistrationController(UserServiceNasad userService) {
        this.userService = userService;
    }

    @GetMapping("/registration")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User()); // Add a new User object to the model
        return "registration";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        // Check if email already exists
        if (userService.existsByEmail(user.getEmail())) {
            model.addAttribute("emailError", "Email already exists.");
            return "registration"; // Assuming "registration" is your registration form view
        }
        
        // Check if username already exists
        if (userService.existsByUsername(user.getUsername())) {
            model.addAttribute("usernameError", "Username already exists.");
            return "registration"; // Assuming "registration" is your registration form view
        }

        // Set role id to 2
        Role role = new Role();
        role.setId(2L);

        // Add the role to the user's roles
        Set<Role> roles = new HashSet<>();
        roles.add(role);
        user.setRoles(roles);

        // Call the service to register the user
        userService.saveUser(user);

        return "redirect:/thankyou";
    }
 


    @GetMapping("/thankyou")
    public String showThankYouPage() {
        return "thankyou";
    }
}

