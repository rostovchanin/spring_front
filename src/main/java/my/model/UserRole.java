package my.model;


import java.io.Serializable;

public class UserRole implements Serializable {
    private Integer id;

    private String roleName;

    public UserRole() {
    }

    public UserRole(Integer id, String roleName) {
        this.id = id;
        this.roleName = roleName;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
