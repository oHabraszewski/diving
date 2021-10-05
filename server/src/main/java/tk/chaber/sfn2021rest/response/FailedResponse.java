package tk.chaber.sfn2021rest.response;

import tk.chaber.sfn2021rest.socket.Event;

import java.util.HashMap;

public class FailedResponse implements EventResponse {

    private final Event requestEvent;
    HashMap<String, Object> payloadObjects = new HashMap<>();

    public FailedResponse(Event responseToEvent, Error error) {
        this.requestEvent = responseToEvent;

        payloadObjects.put("success", false);
        payloadObjects.put("ecode", error.getCode());
        payloadObjects.put("error", error.getMessage());
    }

    @Override
    public HashMap<String, Object> getRawJSONResponse() {
        HashMap<String, Object> response = new HashMap<>(),
                payload = new HashMap<>();

        payloadObjects.forEach(payload::put);

        response.put("event", requestEvent.toString());
        response.put("payload", payload);
        return response;
    }
}
