if (popup_quit) {
	draw_set_color(c_black);
	draw_rectangle(30, 30, 290, 150, false);	
	draw_set_color(c_white);
	draw_rectangle(30, 30, 290, 150, true);	
	
	draw_text(60, 50, "Deseja realmente sair?");
	draw_text(40, 80, "SIM");
	draw_text(180, 80, "NAO");
}

if (!popup_quit) {
	for (var i = 0; i < ds_list_size(options); i++) {
		draw_text(10, room_height / 3 + i * 20, options[| i]);	
		if (options[| i] == "Volume") draw_text(80,  room_height / 3 + i * 20, volume);
	}
	
	draw_rectangle(5, room_height / 3 + current_option * 20 + 8, 7, room_height / 3 + current_option * 18 + 12, false);
} else {
	if (current_option == 0) draw_rectangle(35, 88, 38, 80 + 12, false);
	else draw_rectangle(175, 88, 178, 80 + 12, false);
}

for (var i = 0; i < ds_list_size(rects); i++) {
	draw_rectangle(rects[| i].my_x, rects[| i].my_y, rects[| i].my_x + rects[| i].my_w, rects[| i].my_y + rects[| i].my_h, true);
}
