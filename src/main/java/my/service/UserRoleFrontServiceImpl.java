package my.service;

import my.model.UserRole;
import my.util.Util;
import org.springframework.context.annotation.Primary;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
public class UserRoleFrontServiceImpl implements UserRoleService {
    @Override
    public List<UserRole> getAllUserRoles() {
        final String uri = "http://localhost:8080/ex/api/userRoles";

        RestTemplate restTemplate = Util.createAuthRestTemplate();
        ResponseEntity<List<UserRole>> rolesResponse =
                restTemplate.exchange(uri,
                        HttpMethod.GET, null, new ParameterizedTypeReference<List<UserRole>>() {
                        });
        return rolesResponse.getBody();
    }
}
