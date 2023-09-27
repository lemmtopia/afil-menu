menu_state = "main"; // Temos "main" e "config"
options = ds_list_create();
current_option = 0;
popup_quit = false;

rects = ds_list_create();
full = false;

volume = 0;

function TextRect(xx, yy, ww, hh) constructor  {
	my_x = xx;
	my_y = yy;
	my_w = ww * 14;
	my_h = hh * 14;
}

function change_state() {
	ds_list_clear(options);
	ds_list_clear(rects);
	
	switch (menu_state) {
	case "main":
		ds_list_add(options, "Jogar", "Configuracoes", "Sair");
		break;
	case "config":
		ds_list_add(options, "Volume", "Tela Cheia", "Voltar");
		break;
	}
	
	for (var i = 0; i < ds_list_size(options); i++) {
		ds_list_add(rects, new TextRect(10, room_height / 3 + i * 20, string_length(options[| i]), 1));
	}
}

change_state();

window_set_size(640, 360);
