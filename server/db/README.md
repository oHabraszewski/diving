1.Jak Ci się coś nie podoba, to pisz na dc
2.Adres bazy online: karado.tk:3306 user:'user' hasło:'administratorRADEK' (narazie nie działa, bo serw jest wyłączony)
3.Struktura bazy:

	login{
		ID (int, increment)
		LOGIN (txt, LOGIN=PLAYER_ID)
		PASS (txt, Hash)
		SESSION (txt)
		EMAIL (txt)
	}

	worlds{
		ID (int, increment)
		PLAYERS_IDS (longtekst, JSON loginów graczy, ewentualnie ich dane [osiągniecia, HP itd])
		OWNER_ID (text, login własciciela świata)
		SEED (bigint [20])
		WORLD_DATA (longtekst, JSON)
	}

	rooms{		//wersja beta
		ID (int, increment)
		WORLD_ID (text, nazwa/losowy ciąg znaków)
		ROOM_CONFIG (longtekst, JSON, dane pokoju dla gry multiplayer)
	}


Stan na 24.02.2021
																																								Korzystając z bazy zobowiązujesz się do kupowania kawy dla Janka na każde zajęcia stacjonarne do końca roku kalendarzowego. Nieobecność nie zwalnia z obowiązku zakupu.
	
	
