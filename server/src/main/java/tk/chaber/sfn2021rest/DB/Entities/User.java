package tk.chaber.sfn2021rest.DB.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.criteria.CriteriaBuilder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;

@Entity(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String username;

    private byte[] password;

    private String email;

    private byte[] token;

    private byte[] salt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public byte[] getPassword() {
        return password;
    }

    public void setPassword(String passToHash) {

        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);

        this.setSalt(salt);

        byte[] hashedPassword;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(this.getSalt());
            hashedPassword = md.digest(passToHash.getBytes(StandardCharsets.UTF_8));

            this.password = hashedPassword;

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public byte[] getToken() {
        return token;
    }

    public void setToken(String UK) {
        String username = this.getUsername();

        String toHash = username.concat(UK);

        byte[] token;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(this.getSalt());
            token = md.digest(toHash.getBytes(StandardCharsets.UTF_8));
            this.token = token;
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public byte[] getSalt() {
        return salt;
    }

    public void setSalt(byte[] salt) {
        this.salt = salt;
    }
}
