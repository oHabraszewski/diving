package tk.chaber.sfn2021rest.socket;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class SocketConfig implements WebSocketConfigurer {
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        //Adding new entries for WebSocket and linking them with handlers
        registry.addHandler(new SocketHandler(), "/api/websocket/world").setAllowedOrigins("*");  //TODO: change CORS after WebSocket testing
    }
}
