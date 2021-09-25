package tk.chaber.sfn2021rest.socket.response;

import java.util.HashMap;
import java.util.Map;

public class FailedResponse implements EventResponsing{

    private final String requestEvent;
    HashMap<String, Object> payloadObjects = new HashMap<>();

    public FailedResponse(String responseToEvent) {
        this.requestEvent = responseToEvent;

        payloadObjects.put("success", "false");
    }

    @Override
    public HashMap<String, Object> getRawJSONResponse() {
        HashMap<String, Object> response = new HashMap<>(),
                payload = new HashMap<>();

        payloadObjects.forEach(payload::put);

        response.put("event", requestEvent);
        response.put("payload", payload);
        return response;
    }
}
