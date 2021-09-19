package tk.chaber.sfn2021rest.db.entities;

import javax.persistence.*;

@Entity(name = "rooms")
public class Room {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id", nullable = false, updatable = false, unique = true)
    private Long id;

    private Long worldId;

    private String roomData;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getWorldId() {
        return worldId;
    }

    public void setWorldId(Long worldId) {
        this.worldId = worldId;
    }

    public String getRoomData() {
        return roomData;
    }

    public void setRoomData(String roomData) {
        this.roomData = roomData;
    }
}
