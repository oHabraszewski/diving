package tk.chaber.sfn2021rest.DB.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;

@Entity
public class Users {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String username;

    private byte[] password;

    private String session;

    private String email;

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
//        SecureRandom random = new SecureRandom();
//        byte[] salt = new byte[16];
//        random.nextBytes(salt);
//        System.out.println(salt.toString());

        byte[] hashedPassword;

        try {
            String ourSalt = "heheBoi";
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(ourSalt.getBytes());

            hashedPassword = md.digest(passToHash.getBytes(StandardCharsets.UTF_8));

            this.password = hashedPassword;
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
