package tk.chaber.sfn2021rest.socket.handler.world;

import org.springframework.stereotype.Service;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.db.entities.World;
import tk.chaber.sfn2021rest.socket.EventsEnum;
import tk.chaber.sfn2021rest.socket.response.EventResponding;
import tk.chaber.sfn2021rest.socket.response.FailedResponse;
import tk.chaber.sfn2021rest.socket.response.SuccessResponse;

import java.util.HashMap;

@Service
public class DeletingHandler extends WorldHandler{
    public DeletingHandler() {
        super(EventsEnum.DELETE_WORLD);
    }

    @Override
    public EventResponding handle(HashMap<String, Object> data){
        String username = (String) data.get("username");
        String uniqueKey = (String) data.get("unique_key");

        String worldName = (String) data.get("world_name");

        User owner = usersRepository.findByUsername(username).get(0); //FIXME: vulnerability if somehow there is 2 people with the same username.
        //FIXME: IndexOutOfBounds if there is no player with such an username
        if(owner.checkToken(uniqueKey)){

            if(worldsRepository.existsByOwnerIdAndWorldName(owner.getId(), worldName)) {

                World worldToDelete = worldsRepository.findByOwnerIdAndWorldName(owner.getId(), worldName).get(0); //FIXME: vulnerability if somehow there is 2 worlds with the same name.

                worldsRepository.delete(worldToDelete);

                return new SuccessResponse(this.event);
            }else{
                System.out.println("There is no such world");
                return new FailedResponse(this.event);
            }
        }else{
            System.out.println("Incorrect authentication");
            return new FailedResponse(this.event);
        }

//        List<World> worldsToDelete = worldsRepository.findByOwnerIdAndWorldName(ownerId, worldName);
//
//        if(worldsToDelete.size() > 1){
//            System.out.println("There was issue during deleting world: There is more than 1 world with such name.");
//            throw new Exception("There was issue during deleting world: There is more than 1 world with such name.");
//        }else {
//            System.out.println(worldsToDelete.toString());
//            worldsRepository.delete(worldsToDelete.get(0));
//        }
    }
}
