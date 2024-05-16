extends State
@export var return_state : State
@export var return_animation_node : String = "move"
@export var attack_name : String = "attack"
@export var attackchain_name : String = "attackchain"
@export var attackchain_node : String = "attackchain"

@onready var timer : Timer = $Timer

func state_input ( event : InputEvent):
	if(event.is_action_pressed("attack")):
		timer.start()



func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack_name ||  anim_name== attackchain_name ):
		if(timer.is_stopped()):
			next_state = return_state
			playback.travel(return_animation_node)
		else:
			playback.travel(attackchain_node)
		
	if(anim_name == attackchain_name):
		next_state = return_state
		playback.travel(return_animation_node)
