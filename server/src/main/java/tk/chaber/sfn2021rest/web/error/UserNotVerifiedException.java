package tk.chaber.sfn2021rest.web.error;

public class UserNotVerifiedException extends RuntimeException{
    public UserNotVerifiedException() {
    }

    public UserNotVerifiedException(String message) {
        super(message);
    }

    public UserNotVerifiedException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserNotVerifiedException(Throwable cause) {
        super(cause);
    }
}
