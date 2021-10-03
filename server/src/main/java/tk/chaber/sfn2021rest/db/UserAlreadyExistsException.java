package tk.chaber.sfn2021rest.db;

public class UserAlreadyExistsException extends RuntimeException{
    public UserAlreadyExistsException(){
        super();
    }

    public UserAlreadyExistsException(String message) {
        super(message);
    }

    public UserAlreadyExistsException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserAlreadyExistsException(Throwable cause) {
        super(cause);
    }
}
