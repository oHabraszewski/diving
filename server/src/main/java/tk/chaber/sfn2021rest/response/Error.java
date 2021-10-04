package tk.chaber.sfn2021rest.response;

public enum Error{
    USER_DOES_NOT_EXIST     ("01", "There is no user with such a username."),
    USER_ALREADY_EXISTS     ("02", "There is already a user with such a username/email."),
    AUTH_FAIL               ("06", "Authentication failed."),
    //MULTIPLE_USERS_EXIST    ("09", "Somehow there are 2 or more users with exactly the same usernames."),

    WORLD_DOES_NOT_EXIST    ("11", "There is no world with such a name."),
    WORLD_ALREADY_EXISTS     ("12", "There is already a world with such a name."),
    WORLD_NUMBER_LIMIT      ("15", "This user has achieved limit of stored worlds (10 worlds per user)"),
    MULTIPLE_WORLDS_EXIST   ("19", "Somehow there are 2 or more worlds with exactly the same names."),

    CASTING_IMPOSSIBLE      ("91", "There was problem casting data.");


    private final String code;
    private final String message;

    Error(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
