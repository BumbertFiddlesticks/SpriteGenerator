extends Node

var materials = ["Bone", "Snow", "Boxwood", "Graphite", "Stone", "Wooden", "Water", "Ice", "Birch", "Air", "Crystal", "Magma", "Steel", "Metal", "Plastic", "Concrete", "Glass", "Paper", "Aluminium", "Titanium", "Leather", "Quartz", "Mineral",]
#var foods = ["Beet", "Broccoli", "Celery", "Fish", "Cabbage", "Corn", "Dandelion", "Vanilla", "Chocolate", "Lemon", "Coconut", "Strawberry", "Fiddlehead", "Grape", "Cheese", "Cake", "Zucchini", "Lettuce", "Spinach", "Salt", "Turnip", "Banana", "Cucumber", "Pumpkin", "Squash", "Tomato", "Pepper", "Artichoke", "Sunflower", "Asparagus", "Onion", "Shallot", "Meat", "Herb", "Tofu", "Bread", "Rice", "Carrot", "Mushroom", "Bun", "Milk", "Cereal", "Dumpling", "Sushi", "Spaghetti", "Meatball", "Apple Pie", "Dave"]
#var flavors = ["Sweet", "Sour", "Spicy", "Hot", "Salty", "Bitter",  "Disgusting", "Cheesy"]
var sizes = ["Big", "Small", "Tiny", "Huge", "Massive", "Short", "Grand", "Large"]
var properties = ["Colorful", "Destructive", "Mysterious", "Healing", "Chaotic", "Floating", "Heavy", "Deep", "Hateful", "Unique", "Heavenly", "Radioactive", "Toxic", "Burning", "Freezing", "Beautiful", "Ugly", "Cold", "Great", "Terrible", "Light", "Dark", "Suspicious", "Dutiful", "Scornful", "Deep", "Spiked", "Sharp", "Piercing", "Immortal", "Immovable", "Reactive", "Repulsive", "Conscious", "Acute", "Jagged", "Fine", "Twisted", "Dependable", "Accurate", "Precise", "Unyielding", "Bobs" ]
var colors = ["Red", "Green", "Blue", "Yellow", "Orange", "Pink", "Purple", "Cyan", "Magenta", "Black", "White", "Gray", "Bob"]
var ages = ["Old", "Fresh", "Mature", "New", "Ancient", "Broken", "Fossilized", "Crisp", "Aged", "Fermented", "Tired", "Venerable", "Modern", "Unearthed", "Reborn", "Reclaimed", "Exposed", "Robust", "Bob"]
var things = ["Feather", "Gem", "Orb", "Dust", "Book", "Amulet", "Heart", "Finger", "Pencil", "Weapon", "Calculator", "Cloud", "Bottle", "Branch", "Bag", "Alien", "Fire", "Fork", "Sculpture", "Soul", "Brush", "Sword", "Staff", "Spear", "Dagger", "Axe", "Rod", "Pole", "Stick", "Object", "Trident", "Proof", "Titan", "Constructor", "Blade", "Fabricator", "Bob"]
var other = ["Destruction", "Chaos", "Equality", "Electricity", "Speed", "Mutations", "Aggression", "Worship", "Silence", "Illusion", "Purification", "Growth", "Breaking", "Secrets", "Anger", "Peace", "Doom", "Ending", "Controversy", "Pain", "Utility", "Unlocking", "Fear", "Strength", "Dexterity", "Wisdom", "Charisma", "Wonder", "Magic", "Love", "Bob", "Empathy"]
# size - age - shape - colour - origin - material - purpose
enum text_add {materials, foods, flavors, sizes, properties, colors, ages}
var can_add = [text_add.materials,text_add.foods,text_add.flavors,text_add.sizes,text_add.properties,text_add.ages]

func get_name():
	var name_string = ""

	var has_added = []
	for i in 2:
		var add = _rand_from_array(can_add)
		if has_added.size() == 0 && _rand_chance(0.9):
			has_added.append(add)
		elif !has_added.has(add) && _rand_chance(0.4):
			has_added.append(add)
	
	if has_added.has(text_add.sizes):
		name_string += _rand_from_array(sizes) + " "
	if has_added.has(text_add.ages):
		name_string += _rand_from_array(ages) + " "
	if has_added.has(text_add.colors):
		name_string += _rand_from_array(colors) + " "
	if has_added.has(text_add.properties):
		name_string += _rand_from_array(properties) + " "
	#if has_added.has(text_add.flavors):
	#	name_string += _rand_from_array(flavors) + " "
	if has_added.has(text_add.materials):
		name_string += _rand_from_array(materials) + " "
	
	
	
#	if _rand_chance(0.2 ):
#		name_string += _rand_from_array(sizes) + " "
#	if _rand_chance(0.2):
#		name_string += _rand_from_array(ages) + " "
#	if _rand_chance(0.2):
#		name_string += _rand_from_array(colors) + " "
#	if _rand_chance(0.2):
#		name_string += _rand_from_array(properties) + " "
#	if _rand_chance(0.2):
#		name_string += _rand_from_array(materials) + " "
#	if _rand_chance(0.2):
#		name_string += _rand_from_array(flavors) + " "
	
	if _rand_chance(1.0): # was 0.2
		name_string += _rand_from_array(things) + " "
		name_string += "of "
		name_string += _rand_from_array(other)
	else:
		#if _rand_chance(0.5):
		#	name_string += _rand_from_array(foods)
		#else:
			name_string += _rand_from_array(things)

	return name_string
	
func _rand_chance(chance):
	return rand_range(0.0, 1.0) < chance

func _rand_from_array(arr):
	return arr[randi() % arr.size()]
