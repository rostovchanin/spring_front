package my.controller;

import my.model.User;
import my.service.UserRoleService;
import my.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class AjaxController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @GetMapping("/ajax/users")
    public ResponseEntity<List<User>> getAllUsers() {
        return new ResponseEntity<>(userService.getAllUsers(), HttpStatus.OK);
    }

    @GetMapping(value = "/ajax/users", params = {"id"})
    public ResponseEntity<User> getUser(@RequestParam("id")  Integer id) {

        return new ResponseEntity<>(userService.getUserById(id), HttpStatus.OK) ;
    }

    @PostMapping("/ajax/users")
    public ResponseEntity<User> addUser(@RequestBody User user){
        userService.createUser(user);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @PutMapping("/ajax/users")
    public ResponseEntity<User> editUser(@RequestBody User user){
        userService.updateUser(user);
        return new ResponseEntity<>(userService.getUserById(user.getId()), HttpStatus.OK);
    }

    @DeleteMapping(value = "/ajax/users", params = {"id"})
    public ResponseEntity<Void> deleteUser(@RequestParam("id")  Integer id){
        userService.deleteUserById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
