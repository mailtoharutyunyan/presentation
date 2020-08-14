package com.auth.server;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;

@SpringBootApplication
@EnableAuthorizationServer
public class AuthenticationServerApplication implements CommandLineRunner {

    private final PasswordEncoder passwordEncoder;

    public AuthenticationServerApplication(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public static void main(String[] args) {
        SpringApplication.run(AuthenticationServerApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        String hashedPassword = passwordEncoder.encode("password");
        System.out.println(hashedPassword);
    }
}
