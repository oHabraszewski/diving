package tk.chaber.sfn2021rest.db.entities;

import tk.chaber.sfn2021rest.utils.Hasher;
import tk.chaber.sfn2021rest.utils.Randomizer;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;

@Entity(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id", nullable = false, updatable = false, unique = true)
    private Long id;

    private String username;

    @Column(length = 60)
    private String password;

    private String email;

    private boolean enabled;

    private String secret;

    public User(){
        super();
        this.enabled = false;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }
}
