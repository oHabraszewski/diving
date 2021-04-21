package tk.chaber.sfn2021rest.utils;

import java.security.SecureRandom;

public class Randomizer {
    private static SecureRandom random = new SecureRandom();

    public static boolean randomBoolean(){
        return random.nextBoolean();
    }

    public static float randomFloat(){
        return random.nextFloat();
    }

    public static double randomDouble(){
        return random.nextDouble();
    }

    public static int randomInt(){
        return random.nextInt();
    }

    public static int randomInt(int limit){
        return random.nextInt(limit);
    }

    public static long randomLong(){
        return random.nextLong();
    }

    public static byte[] randomBytes(int size){
        byte[] bytes = new byte[size];
        random.nextBytes(bytes);
        return bytes;
    }
}
