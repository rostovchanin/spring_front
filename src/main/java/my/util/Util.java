package my.util;


import org.springframework.http.client.support.BasicAuthenticationInterceptor;
import org.springframework.web.client.RestTemplate;


public class Util {
    public static RestTemplate createAuthRestTemplate(){
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthenticationInterceptor("api", "abc123"));
        return restTemplate;
    }
}
