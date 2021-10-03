package tk.chaber.sfn2021rest.db;

import tk.chaber.sfn2021rest.db.validation.ValidEmail;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class RegisterUserDto extends UserDto{
    @ValidEmail
    @NotNull
    @NotEmpty
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
