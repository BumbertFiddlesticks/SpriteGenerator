extends Node

# dawnbringer 32 color palette (+ 2 extra, starred):
const allCols = [
		Vector3(34.0, 32.0, 52.0),    # outline         # 0
		Vector3(69.0, 40.0, 60.0),    # dark purple     # 1
		Vector3(102.0, 57.0, 49.0),   # dark brown      # 2 
		Vector3(143.0, 86.0, 59.0),   # brown           # 3
		Vector3(180.0, 123.0, 80.0),  # medium brown *  # 4
		Vector3(223.0, 113.0, 38.0),  # orange          # 5
		Vector3(217.0, 160.0, 102.0), # light brown     # 6
		Vector3(238.0, 195.0, 154.0), # lightest brown  # 7
		Vector3(251.0, 242.0, 54.0),  # yellow          # 8
		Vector3(153.0, 229.0, 80.0),  # light green     # 9
		Vector3(106.0, 190.0, 48.0),  # green           # 10
		Vector3(55.0, 148.0, 110.0),  # turquoise       # 11
		Vector3(75.0, 105.0, 47.0),   # dark green      # 12
		Vector3(82.0, 75.0, 36.0),    # mud brown       # 13
		Vector3(50.0, 60.0, 57.0),    # darkest grey    # 14
		Vector3(63.0, 63.0, 116.0),   # navy blue       # 15
		Vector3(48.0, 96.0, 130.0),   # dark turquoise  # 16
		Vector3(91.0, 110.0, 225.0),  # blue            # 17
		Vector3(99.0, 155.0, 255.0),  # medium blue     # 18
		Vector3(95.0, 205.0, 228.0),  # light blue      # 19
		Vector3(203.0, 219.0, 252.0), # lightest grey   # 20
		Vector3(255.0, 255.0, 255.0), # white           # 21
		Vector3(155.0, 173.0, 183.0), # light grey      # 22
		Vector3(132.0, 126.0, 135.0), # medium grey     # 23
		Vector3(105.0, 106.0, 106.0), # grey            # 24
		Vector3(89.0, 86.0, 82.0),    # dark grey       # 25
		Vector3(118.0, 66.0, 138.0),  # purple          # 26
		Vector3(172.0, 50.0, 50.0),   # red             # 27
		Vector3(217.0, 87.0, 99.0),   # light red       # 28
		Vector3(215.0, 123.0, 186.0), # pink            # 29
		Vector3(143.0, 151.0, 74.0),  # mud green       # 30
		Vector3(138.0, 111.0, 48.0),  # dark mud green  # 31
		Vector3(255.0, 182.0, 45.0)   # gold *          # 32
]

const colorSchemes = [
	[8, 32, 5, 3, 15, 16, 17, 18, 19, 20, 21],    # gold -> blue      # 0
	[20, 22, 23, 24, 25, 14, 12, 10, 9, 20, 21],  # grey -> green     # 1
	[20, 22, 23, 25, 14, 15, 16, 17, 19, 20, 21], # grey -> blue      # 2
	[1, 2, 3, 4, 6, 7, 21],                       # brown             # 3
	[1, 2, 3, 4, 6, 7, 12, 10, 9],                # brown -> green    # 4
	[1, 27, 5, 32, 8, 21],                        # orange            # 5
	[15, 26, 28, 29, 19, 8, 21],                  # bright mix        # 6
	[16, 11, 10, 9, 20, 21],                      # green             # 7
	[1, 2, 3, 5, 32, 8],                          # brown -> gold     # 8
	[1, 2, 3, 17, 19, 20, 21],                    # brown -> blue     # 9
	[15, 26, 28, 32, 8, 19, 20, 21],              # bright mix 2      # 10
	[1, 13, 31, 30, 9, 17, 19, 20, 21],           # mud brown -> blue # 11
	[15, 17, 19, 20, 21],                         # blue              # 12
	[15, 16, 17, 18, 19, 20, 21],                 # blue 2            # 13
	[2, 27, 28, 32, 8, 21],                       # brown-red -> gold # 14
	[1, 15, 11, 18, 9, 20, 21],                   # blue-green-white  # 15
	[15, 26, 23, 11, 10, 9, 20, 21],              # i think purple    # 16
	[12, 11, 10, 20, 21],                         # green 2           # 17
	[14, 15, 17, 19, 20, 21]                      # blue 3            # 18
]

# if -1, choose index randomly, else use index mod length
func choose_colorscheme(index):
	if index == -1:
		index = randi();
	index = index % colorSchemes.size()
	var cols = PoolColorArray()
	var colArr = colorSchemes[index] 
	for i in range(0, colArr.size(), 1):
		var vec3 = allCols[colArr[i]] / 255.0
		cols.append(Color(vec3.x, vec3.y, vec3.z))
	return cols


# not in use
# Using ideas from https://www.iquilezles.org/www/articles/palettes/palettes.htm
func generate_new_colorscheme(n_colors):
	var a = Vector3(rand_range(0.0, 0.5), rand_range(0.0, 0.5), rand_range(0.0, 0.5))
	var b = Vector3(rand_range(0.1, 0.6), rand_range(0.1, 0.6), rand_range(0.1, 0.6))
	var c = Vector3(rand_range(0.15, 0.8), rand_range(0.15, 0.8), rand_range(0.15, 0.8))
	var d = Vector3(rand_range(0.0, 1.0), rand_range(0.0, 1.0), rand_range(0.0, 1.0))

	var cols = PoolColorArray()
	var n = float(n_colors - 1.0)
	for i in range(0, n_colors, 1):
		var vec3 = Vector3()
		vec3.x = (a.x + b.x *cos(6.28318 * (c.x*float(i/n) + d.x))) + (i/n)*0.8
		vec3.y = (a.y + b.y *cos(6.28318 * (c.y*float(i/n) + d.y))) + (i/n)*0.8
		vec3.z = (a.z + b.z *cos(6.28318 * (c.z*float(i/n) + d.z))) + (i/n)*0.8

		cols.append(Color(vec3.x, vec3.y, vec3.z))
	
	return cols
