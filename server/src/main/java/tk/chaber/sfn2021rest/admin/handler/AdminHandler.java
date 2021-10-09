package tk.chaber.sfn2021rest.admin.handler;

import tk.chaber.sfn2021rest.admin.AdminEvent;

import java.util.HashMap;

public interface AdminHandler {
    boolean handle(HashMap<String, Object> data);

    AdminEvent getEvent();
}
