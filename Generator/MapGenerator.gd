extends Node

func generate_new(size):
	var map = _get_random_map(size)
	for i in 2 + randi() % 4:
		_random_walk(size, map)
	return map

func _random_walk(size, map):
	var pos = Vector2(size.x * 0.5, (randi() % int(0.8 * size.y)))
	for i in 55 + randi() % 40:
		_set_at_pos(map, pos, true)
		
		_set_at_pos(map, Vector2(size.x - pos.x - 1, pos.y), true)
		
		# maybe 2 * is unecessary. (moves up/down more than left/right)
		pos += Vector2(randi()%3-1, 2 * (randi()%3-1))

func _get_random_map(size):
	var map = []
	for x in size.x:
		map.append([])
	
	for x in range(0, ceil(size.x * 0.5)):
		var arr = []
		for y in range(0, size.y):
			var r = y/size.y
			var rand = r #4.0 * (1.0-r) * r #3.0 * pow(r - 5.0 / 16.0, 2) * (r - 21.0/16.0)
			arr.append(rand_bool((0.8 - 0.5) * r + 0.5)) #0.8 #0.48 
			#arr.append(rand_bool(min(1.0,r + rand_range(0.0,1.0)))) #0.48

			if x == floor(size.x*0.5) - 1 && y > rand_range(0.0,0.2) * size.y:
				arr[y] = true
			elif r > 1.0 - 12.0 / 64.0 && r < 1.0 - 6.0 / 64.0:
				arr[y] = false
			
		map[x] = (arr.duplicate(true))
		map[size.x - x - 1] = (arr.duplicate(true))

	return map

func _set_at_pos(map, pos, val):
	if pos.x < 0 || pos.x >= map.size() || pos.y < 0 || pos.y >= map[pos.x].size():
		return false
	
	map[pos.x][pos.y] = val
	
	return true

func rand_bool(chance):
	return rand_range(0.0, 1.0) > chance
