package tk.chaber.sfn2021rest.web.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class BoardRecordDto {
    @NotNull
    @NotEmpty
    private String username;

    @NotNull
    @NotEmpty
    private String secret;

    @NotNull
    @NotEmpty
    private String time;

    @NotNull
    @NotEmpty
    private Long score;

    public BoardRecordDto(@NotNull @NotEmpty String username, @NotNull @NotEmpty String secret, @NotNull @NotEmpty String time, @NotNull @NotEmpty Long score) {
        this.username = username;
        this.secret = secret;
        this.time = time;
        this.score = score;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }
}
