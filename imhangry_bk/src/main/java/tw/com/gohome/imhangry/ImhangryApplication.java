package tw.com.gohome.imhangry;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class ImhangryApplication {

	public static void main(String[] args) {
		SpringApplication.run(ImhangryApplication.class, args);
	}

}
