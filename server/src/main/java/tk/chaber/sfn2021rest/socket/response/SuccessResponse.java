package tk.chaber.sfn2021rest.socket.response;

import java.util.HashMap;
import java.util.Map;

public class SuccessResponse implements EventResponsing{

    private final String requestEvent;
    HashMap<String, Object> payloadObjects = new HashMap<>();

    public SuccessResponse(String responseToEvent) {
        this.requestEvent = responseToEvent;

        payloadObjects.put("success", "true");
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
