package com.abc.carportal.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeRequests(authorize -> authorize
                .requestMatchers("/", "/home", "/registration", "/loginform").permitAll()
                .requestMatchers("/cars", "/new_car", "/car_detail", "/search", "/profile").hasAnyRole("ADMIN", "USER")
                .requestMatchers("/users").hasRole("ADMIN")
                .requestMatchers("/images/**", "/css/**", "/js/**").permitAll()
                
            )

            .formLogin(form -> form
                .loginPage("/loginform")
                .loginProcessingUrl("/login")
                .failureUrl("/loginform?error=true") // Redirect to login form with error parameter
                .defaultSuccessUrl("/cars")
                .permitAll()
            )
            .logout(logout -> logout
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/home")
                .permitAll()
            );
        return http.build();
    }
}
