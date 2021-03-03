package tk.chaber.sfn2021rest;

public class RegisterUser {
    private String username;
    private String password;
    private String email;

    public RegisterUser(String username, String password, String email){
        this.username = "Hello " + username;
        this.password = "Password: " + password;
        this.email = "Email: " + email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
