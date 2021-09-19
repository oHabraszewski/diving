package tk.chaber.sfn2021rest.db.entities;

import javax.persistence.*;
import java.math.BigInteger;

@Entity(name = "worlds")
public class World {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id", nullable = false, updatable = false, unique = true)
    private Long id;

    private String worldName;

    private Long ownerId;

    private Long seed;

    private String worldData;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWorldName() {
        return worldName;
    }

    public void setWorldName(String worldName) {
        this.worldName = worldName;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    public Long getSeed() {
        return seed;
    }

    public void setSeed(Long seed) {
        this.seed = seed;
    }

    public String getWorldData() {
        return worldData;
    }

    public void setWorldData(String worldData) {
        this.worldData = worldData;
    }
}
