package it.discovery;

import it.discovery.model.Product;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureDataJpa;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.MySQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;

import it.discovery.repository.ProductRepository;

@Testcontainers
@AutoConfigureDataJpa
@SpringBootTest(webEnvironment = WebEnvironment.NONE)
public class ProductRepositoryTest {

	@Container
	static MySQLContainer mysql = new MySQLContainer<>("mysql:8")
		.withExposedPorts(3306);

	@DynamicPropertySource
	static void mysqlProperties(DynamicPropertyRegistry registry) {
		registry.add("spring.datasource.url",
				() -> String.format("jdbc:mysql://localhost:%s/test", 
						mysql.getMappedPort(3306)));
	}

	@Autowired
	ProductRepository productRepository;

	@Test
	void saveProduct_success() {
		Product product = new Product();
		product.setName("Training");

		productRepository.save(product);

	}
}
