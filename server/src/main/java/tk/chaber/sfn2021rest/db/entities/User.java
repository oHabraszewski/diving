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

    private byte[] password;

    private String email;

    private byte[] token;

    private byte[] salt;

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

    public byte[] getPassword() {
        return password;
    }

    public void setPassword(String passToHash) { //Hashes password and then saves it

        byte[] salt = Randomizer.randomBytes(16);

        this.setSalt(salt);

        try {
            byte[] hashedPassword = Hasher.hashWithSalt(passToHash, salt);

            this.password = hashedPassword;

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public byte[] getToken() {
        return token;
    }

    public void setToken(String UK) { //Generates token based on given UniqueKey
        String username = this.getUsername();

        String toHash = username.concat(UK);

        try {
            byte[] token = Hasher.hashWithSalt(toHash, this.getSalt());
            this.token = token;
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public boolean checkToken(String UK){
        String username = this.getUsername();
        String toCheck = username.concat(UK);

        try {
            byte[] toCheckToken = Hasher.hashWithSalt(toCheck, this.getSalt());

            return Arrays.equals(this.getToken(), toCheckToken);
        }catch (Exception e){
            e.printStackTrace();
            return false;
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
