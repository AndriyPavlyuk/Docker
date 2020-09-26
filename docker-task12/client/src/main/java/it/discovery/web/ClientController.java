package it.discovery.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ClientController {
    private final RestTemplate restTemplate = new RestTemplate();

    @GetMapping("greeting/{name}")
    public String hi(@PathVariable String name) {
        return restTemplate.getForObject("http://server:9000/greeting/" + name,
                String.class);
    }
}
