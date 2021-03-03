package tk.chaber.sfn2021rest;

public class Response {
    private String error;
    private String session;

    public Response(String error, String session) {
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
}
