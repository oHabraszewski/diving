## Database structure

	login{
		ID          (int, increment)
		LOGIN       (txt)
		PASS        (txt, Hash)
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
																																								Korzystając z bazy zobowiązujesz się do kupowania kawy dla Janka na każde zajęcia stacjonarne do końca roku kalendarzowego. Nieobecność nie zwalnia z obowiązku zakupu.
	
	
