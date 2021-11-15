//
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
//var _playerHealthFrac = frac(_playerHealth);
//_playerHealth -= _playerHealthFrac;

for(var i=1; i<=_playerHealthMax; i++){
	var _imageIndex = (i >_playerHealth);
	draw_sprite(sHealth,_imageIndex,20+((i-1)*35), 20);	
}

//Draw Item box
_xx = 20;
_yy = 60;

draw_sprite(sItemBox,0,_xx+20,_yy-5);
if(global.playerHasAnyItems){
	draw_sprite(sItem,global.playerEquipped,_xx, _yy);
	if(global.playerAmmo[global.playerEquipped] != -1){
		
	
		draw_set_font(fAmmo);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_color(c_white);
		if(global.playerEquipped == 2){
				draw_text(
			_xx + sprite_get_width(sItemBox)-20,
			_yy + sprite_get_height(sItemBox)-65
			,
			"Zeus"
			);
		} else{
				draw_text(
			_xx + sprite_get_width(sItemBox)+1,
			_yy + sprite_get_height(sItemBox)+1,
			"Dyonisis"
			);
		}
		
	}
}

if (global.gamePaused){
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,RESOLUTION_W,RESOLUTION_H,false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fMenu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	with(Player){
		if(state==PlayerStateDead){
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 - 30, "GAME OVER");
			oUI.pauseOption = oUI.gameOverOption;
		} else {
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 - 30, "GAME PAUSED");
		}
		
	}
	
	for (var i=0; i < array_length(pauseOption);i++){
			var _print="";
			if(i==pauseOptionSelected){
				_print += "0 " + pauseOption[i] + " 0";
			} else {
				_print += pauseOption[i];
				draw_set_alpha(0.7);
			}
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 18 +(i*40), _print);
			draw_set_alpha(1.0);
		}
	
	
	
}