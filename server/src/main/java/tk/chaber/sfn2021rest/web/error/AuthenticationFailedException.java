package tk.chaber.sfn2021rest.web.error;

public class AuthenticationFailedException extends RuntimeException {
    public AuthenticationFailedException() {
    }

    public AuthenticationFailedException(String message) {
        super(message);
    }

    public AuthenticationFailedException(String message, Throwable cause) {
        super(message, cause);
    }

    public AuthenticationFailedException(Throwable cause) {
        super(cause);
    }
}
