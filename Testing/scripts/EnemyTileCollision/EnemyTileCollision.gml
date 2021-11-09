// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyTileCollision(){


	var _collision = false; //in case a collision is a trigger

	//TILES H collision
	//tilemap_get_at_pixel function returns number of tile in tile map. 0 is no tile, 1 is collision tile, etc.
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE; //snaps us to the -> left <- of the tile we're colliding with
		if(sign(hSpeed) == 1)
			x += TILE_SIZE - 1;  //snaps us to the -> right <- of the tile we're colliding 
		hSpeed = 0;
		_collision = true;
	}
	
	
	x += hSpeed;

	
	
	//TILE H collision
	if(tilemap_get_at_pixel(collisionMap, x, y + vSpeed))// || (tilemap_get_at_pixel(collisionMap, x, y + vSpeed + TILE_SIZE) && sign(vSpeed) == 1 ))
	{
		y -= y mod TILE_SIZE; //snaps us to the -> up <- of the tile we're colliding with
		if(sign(vSpeed ) == 1)
			y += TILE_SIZE -1;  //snaps us to the -> down <- of the tile we're colliding with
		vSpeed = 0;
		_collision = true;
	}

	y += vSpeed;


	return _collision;
}