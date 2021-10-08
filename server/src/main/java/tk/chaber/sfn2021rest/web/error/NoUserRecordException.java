package tk.chaber.sfn2021rest.web.error;

public class NoUserRecordException extends RuntimeException {
    public NoUserRecordException() {
    }

    public NoUserRecordException(String message) {
        super(message);
    }

    public NoUserRecordException(String message, Throwable cause) {
        super(message, cause);
    }

    public NoUserRecordException(Throwable cause) {
        super(cause);
    }
}
