package id.co.cpu.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication(scanBasePackages={"id.co.cpu"})
@EnableAsync
@EnableTransactionManagement
@EnableAutoConfiguration
@EnableResourceServer
@EnableConfigurationProperties
@EnableFeignClients(basePackages = {"id.co.cpu.feign"})
@EnableJpaRepositories(basePackages = { "id.co.cpu.*.dao" })
public class Application extends SpringBootServletInitializer {

	private static final Logger LOG = LoggerFactory.getLogger(Application.class);
	
    public static void main(String[] args) {
	    SpringApplication.run(Application.class, args);
        LOG.info("RIP!");
    }

}
