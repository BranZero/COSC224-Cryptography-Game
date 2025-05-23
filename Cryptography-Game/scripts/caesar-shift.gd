extends HBoxContainer

signal left_pressed;
signal right_pressed;

var shift = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_left_pressed():
	#Play Click Sound Effect
	GlobalSounds.caesarClick.play();
	#Calculate Current Shift Amount
	shift = (shift - 1) % 26;
	#Code to display 0 if number is less than 10
	if((26 + shift) % 26 < 10):
		$shift.text = "0" + str((26 + shift) % 26);
	else:
		$shift.text = str((26 + shift) % 26);
	left_pressed.emit();
	return shift;

func _on_right_pressed():
	#Play Click Sound Effect
	GlobalSounds.caesarClick.play();
	#Calculate Current Shift Amount
	shift = (shift + 1) % 26;
	#Code to display 0 if number is less than 10
	if((26 + shift) % 26 < 10):
		$shift.text = "0" + str((26 + shift) % 26);
	else:
		$shift.text = str((26 + shift) % 26);
	right_pressed.emit();
	return shift;
	
func get_shift():
	return shift;
	
func shift_left(text):
	#Convert to ASCII array for shifting
	var letters = text.to_upper().to_ascii_buffer();
	for i in range(letters.size()):
		var n = letters[i];
		
		#Ignore Spaces
		if(n > 64 && n < 92):
			if(n == 65):
				n += 26;
			#Shifting Logic
			letters[i] = ((n - 65 - 1) % 26) + 65;
	#Revert Back to string
	text = letters.get_string_from_ascii();
	#Add Center Alignment and return
	return text;
	
func shift_right(text):
	#Convert to ASCII array for shifting
	var letters = text.to_upper().to_ascii_buffer();
	for i in range(letters.size()):
		var n = letters[i];
		#Ignore Spaces
		if(n != 32):
			#Shifting Logic
			letters[i] = ((n - 65 + 1) % 26) + 65;
	#Revert Back to string
	text = letters.get_string_from_ascii();
	#Add Center Alignment and return
	return text;
	
func incorrect() -> void:
	GlobalSounds.incorrect.play();
