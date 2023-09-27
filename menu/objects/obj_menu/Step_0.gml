if (keyboard_check_pressed(vk_down)) current_option++;
if (keyboard_check_pressed(vk_up)) current_option--;

if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
	switch (options[| current_option]) {
	case "Jogar":
		room_goto(rm_gameplay);
		break;
	case "Configuracoes":
		menu_state = "config";
		change_state();
		break;
	case "Sair":
		ds_list_clear(options);
		ds_list_clear(rects);
		ds_list_add(options, "SIM", "NAO");
		
		ds_list_add(rects, new TextRect(40, 80, string_length("SIM"), 1));
		ds_list_add(rects, new TextRect(180, 80, string_length("NAO"), 1));
		popup_quit = true;
		break;
	case "Volume":
		volume++;
		break;
	case "Voltar":
		menu_state = "main";
		change_state();
		break;
	case "SIM":
		game_end();
		break;
	case "NAO":
		popup_quit = false;
		menu_state = "main";
		change_state();
		break;
	case "Tela Cheia":
		full = !full;
		window_set_fullscreen(full);
		break;
	}
}	

if (keyboard_check_pressed(vk_backspace) || mouse_check_button_pressed(mb_right)) {
	if (options[| current_option] == "Volume") volume--;	
}

for (var i = 0; i < ds_list_size(rects); i++) {
	if (point_in_rectangle(mouse_x, mouse_y, rects[| i].my_x, rects[| i].my_y, rects[| i].my_x + rects[| i].my_w, rects[| i].my_y + rects[| i].my_h)) {
		current_option = i;	
	}
}

current_option = clamp(current_option, 0, ds_list_size(options) - 1); // Assim pode ter tamanho variável
volume = clamp(volume, 0, 10);