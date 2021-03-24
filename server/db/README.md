## Database structure

	login{
		ID          (int, increment)
		LOGIN       (txt)
		PASS        (blob, Hash)
		SESSION     (txt)
		EMAIL       (txt, email)
	}

	worlds{
		ID          (int, increment)
		WORLD_NAME  (text)
		OWNER_ID    (int, ID in login)
		SEED        (bigint [20])
		WORLD_DATA  (longtext, JSON)
	}

	rooms{
		ID          (int, increment)
		WORLD_ID    (int, ID in worlds)
		ROOM_DATA   (longtext, JSON)
	}
	
	
