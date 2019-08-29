package my.controller;

import my.model.User;
import my.model.UserRole;
import my.service.UserRoleService;
import my.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping({"/user"})
    public ModelAndView helloUser(Principal principal){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("helloUser");
        if(principal != null){
            modelAndView.addObject("user", userService.getUserByName(principal.getName()));
        }
        return modelAndView;
    }

    @RequestMapping({"/", "/admin/allUsers", "/admin"})
    public ModelAndView getUserList(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("allUsers");
        modelAndView.addObject("users", userService.getAllUsers());
        modelAndView.addObject("userRoles", userRoleService.getAllUserRoles());
        return  modelAndView;
    }

    @RequestMapping(value="/admin/editUser", method= RequestMethod.GET)
    public ModelAndView editUserGet(@RequestParam(name = "id", required = false)  Integer userId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("editUser");

        if(userId != null){
            User editUser = userService.getUserById(userId);
            if(editUser != null){
                modelAndView.addObject("editUser", editUser);
            }
        }
        modelAndView.addObject("userRoles", userRoleService.getAllUserRoles());
        modelAndView.addObject("users", userService.getAllUsers());
        return  modelAndView;
    }

    @RequestMapping(value="/admin/editUser", method= RequestMethod.POST)
    public ModelAndView editUserPost(@ModelAttribute("user") User user, @RequestParam("role_id")  Integer userRoleId){
        user.setUserRole(new UserRole(userRoleId, null));
        if(user.getId() == null){
            userService.createUser(user);
        }else{
            userService.updateUser(user);
        }
        return new ModelAndView("redirect:/admin/allUsers?updateOk=1");
    }

    @RequestMapping(value="/admin/deleteUser", method= RequestMethod.GET)
    public ModelAndView deleteUserGet(@RequestParam("id")  Integer userId){
        userService.deleteUserById(userId);
        return new ModelAndView("redirect:/admin/allUsers?deleteOk=1");
    }

    @GetMapping("/admin/getUserById")
    @ResponseBody
    public User getUserById(Integer id){
        return userService.getUserById(id);
    }
}
