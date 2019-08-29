package my.service;

import my.model.User;

import java.util.List;

public interface UserService {
    List<User> getAllUsers();
    User getUserById(Integer id);
    User getUserByName(String name);
    void createUser(User user);
    void updateUser(User user);
    void deleteUserById(Integer id);
}
