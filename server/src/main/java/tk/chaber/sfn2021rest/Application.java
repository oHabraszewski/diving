package tk.chaber.sfn2021rest;

import tk.chaber.sfn2021rest.util.ConfigVars;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);  //Starting API
	}

	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {  //CORS configuration TODO: change links on production
				registry.addMapping("/register").allowedOrigins(ConfigVars.HOSTNAME);
				registry.addMapping("/").allowedOrigins(ConfigVars.HOSTNAME);
			}
		};
	}
}
