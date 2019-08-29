package my.service;

import my.model.User;
import my.util.Util;
import org.springframework.context.annotation.Primary;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.support.BasicAuthenticationInterceptor;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserFrontServiceImpl implements UserService {
    private final String URL_PREF = "http://localhost:8080/ex";


    @Override
    public List<User> getAllUsers() {
        final String uri = URL_PREF + "/api/users";

        RestTemplate restTemplate = Util.createAuthRestTemplate();
        ResponseEntity<List<User>> rolesResponse =
                restTemplate.exchange(uri,
                        HttpMethod.GET, null, new ParameterizedTypeReference<List<User>>() {
                        });
        return rolesResponse.getBody();
    }

    @Override
    public User getUserByName(String name) {
        final String uri = URL_PREF + "/api/users?name={name}";

        Map<String, String> params = new HashMap<String, String>();
        params.put("name", name);

        RestTemplate restTemplate = Util.createAuthRestTemplate();
        return restTemplate.getForObject ( uri, User.class, params);
    }

    @Override
    public void createUser(User user){
        final String uri = URL_PREF + "/api/users";
        RestTemplate restTemplate = Util.createAuthRestTemplate();
        restTemplate.postForObject(uri, user, User.class);
    }

    @Override
    public void updateUser(User user){
        final String uri = URL_PREF + "/api/users";
        RestTemplate restTemplate = Util.createAuthRestTemplate();
        restTemplate.put(uri, user);
    }

    @Override
    public User getUserById(Integer id){
        final String uri = URL_PREF + "/api/users?id={id}";

        Map<String, String> params = new HashMap<String, String>();
        params.put("id", id.toString());

        RestTemplate restTemplate = Util.createAuthRestTemplate();
        return restTemplate.getForObject ( uri, User.class, params);
    }

    @Override
    public void deleteUserById(Integer id){
        final String uri = URL_PREF + "/api/users?id={id}";
        Map<String, String> params = new HashMap<String, String>();
        params.put("id", id.toString());

        RestTemplate restTemplate = Util.createAuthRestTemplate();
        restTemplate.delete(uri, params);
    }
}
