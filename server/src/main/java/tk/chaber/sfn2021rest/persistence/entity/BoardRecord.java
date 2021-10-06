package tk.chaber.sfn2021rest.persistence.entity;

import javax.persistence.*;

@Entity
public class BoardRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Long time;

    private Long score;

    @OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name="user_id")
    private User user;

    private Long calculateTime(String timeInMMSS){
        String[] times = timeInMMSS.split(":");
        long minutes = Integer.parseInt(times[0]);
        long seconds = Integer.parseInt(times[1]);

        return (60 * minutes + seconds);
    }

    public BoardRecord() {
        super();
    }

    public BoardRecord(User user, Long score, String timeString){
        this.user = user;
        this.score = score;
        this.time = calculateTime(timeString);
    }

    public Long getTime() {
        return time;
    }

    public String getTimeInString(){
        long minutes = time/60;
        long seconds = time%60;
        return minutes + ":" + seconds;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
