package tk.chaber.sfn2021rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/registration").allowedOrigins("http://localhost:8080");
				registry.addMapping("/register").allowedOrigins("http://localhost:8080 ");
				registry.addMapping("/").allowedOrigins("http://localhost:8080 ");
				registry.addMapping("").allowedOrigins("http://localhost:8080 ");
			}
		};
	}

}
