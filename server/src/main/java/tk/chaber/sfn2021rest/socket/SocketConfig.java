package tk.chaber.sfn2021rest.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import tk.chaber.sfn2021rest.util.ConfigVars;

@Service
@Configurable
@Configuration
@EnableWebSocket
public class SocketConfig implements WebSocketConfigurer {
    @Autowired
    private EventSocketBroker broker;

    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        //Adding new entries for WebSocket and linking them with handlers
        registry.addHandler(broker, ConfigVars.API_PREFIX + "/websocket/broker") //TODO: change CORS after WebSocket testing
                .setAllowedOrigins(ConfigVars.HOSTNAME);
    }
}
