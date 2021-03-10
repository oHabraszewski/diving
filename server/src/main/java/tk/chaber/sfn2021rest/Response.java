package tk.chaber.sfn2021rest;

public class Response {

    private boolean success;
    private String error;
    private String session;

    public Response(boolean success, String error, String session) {
        this.success = success;
        this.error = error;
        this.session = session;
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
