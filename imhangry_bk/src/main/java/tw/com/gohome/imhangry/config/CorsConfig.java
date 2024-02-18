package tw.com.gohome.imhangry.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class CorsConfig {
    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        // config.addAllowedOrigin("http://localhost:5173");
        List<String> s = new ArrayList<>();
        s.add("http://localhost:5173/");
        s.add("http://localhost:4173/");
        s.add("http://192.168.24.55:5173/");
        s.add("http://192.168.24.55:4173/");
        config.setAllowedOrigins(s);
        config.setAllowCredentials(true);
        config.addAllowedMethod("*");
        config.addAllowedHeader("*");
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }

}
