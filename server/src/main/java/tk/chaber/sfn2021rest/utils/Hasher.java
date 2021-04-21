package tk.chaber.sfn2021rest.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hasher {
    public static byte[] hashWithSalt(String toHash, byte[] salt) throws NoSuchAlgorithmException {
        byte[] hash;

        MessageDigest md = MessageDigest.getInstance("SHA-512");
        md.update(salt);
        hash = md.digest(toHash.getBytes(StandardCharsets.UTF_8));

        return hash;
    }
}
