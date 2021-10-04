package tk.chaber.sfn2021rest.web.controller.registration;

import org.springframework.context.ApplicationEvent;
import tk.chaber.sfn2021rest.persistence.entity.User;

public class OnRegistrationCompleteEvent extends ApplicationEvent {
    private String appUrl;
    private User user;

    public OnRegistrationCompleteEvent(String appUrl, User user) {
        super(user);
        this.appUrl = appUrl;
        this.user = user;
    }

    public String getAppUrl() {
        return appUrl;
    }

    public void setAppUrl(String appUrl) {
        this.appUrl = appUrl;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
