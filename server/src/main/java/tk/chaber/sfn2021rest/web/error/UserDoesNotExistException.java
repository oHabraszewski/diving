package tk.chaber.sfn2021rest.web.error;

public class UserDoesNotExistException extends RuntimeException{
    public UserDoesNotExistException() {
    }

    public UserDoesNotExistException(String message) {
        super(message);
    }

    public UserDoesNotExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserDoesNotExistException(Throwable cause) {
        super(cause);
    }
}

