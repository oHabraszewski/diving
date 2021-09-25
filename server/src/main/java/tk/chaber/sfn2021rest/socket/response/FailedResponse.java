package tk.chaber.sfn2021rest.socket.response;

import tk.chaber.sfn2021rest.socket.EventsEnum;

import java.util.HashMap;

public class FailedResponse implements EventResponding {

    private final EventsEnum requestEvent;
    HashMap<String, Object> payloadObjects = new HashMap<>();

    public FailedResponse(EventsEnum responseToEvent, String errorMessage) {
        this.requestEvent = responseToEvent;

        payloadObjects.put("success", false);
        payloadObjects.put("error", errorMessage);
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
