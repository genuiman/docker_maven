package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class App {

    @GetMapping("/")
    public String home() {
        return "Hello, Maven on Render!";
    }

    public static void main(String[] args) {
        String port = System.getenv("PORT");
        if (port == null) {
            port = "8080"; // Порт по умолчанию
        }
        SpringApplication.run(App.class, new String[] { "--server.port=" + port });
    }
}
