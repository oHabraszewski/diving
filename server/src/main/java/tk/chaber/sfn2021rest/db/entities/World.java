package tk.chaber.sfn2021rest.db.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigInteger;

@Entity(name = "worlds")
public class World {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;

    private String worldName;

    private Integer ownerId;

    private BigInteger seed;

    private String worldData;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWorldName() {
        return worldName;
    }

    public void setWorldName(String worldName) {
        this.worldName = worldName;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public BigInteger getSeed() {
        return seed;
    }

    public void setSeed(BigInteger seed) {
        this.seed = seed;
    }

    public String getWorldData() {
        return worldData;
    }

    public void setWorldData(String worldData) {
        this.worldData = worldData;
    }
}
