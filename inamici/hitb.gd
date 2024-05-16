extends State

class_name HitStateb

@export  var damageableb : damageableb
@export var dead_state : State
@export var dead_animation_node : String = "dead"
@export var knockback_speed : float = 100.0
@export var return_state : State


@onready var timer : Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	damageableb.connect("on_hit", on_damageable_hit)
	
func on_enter():
	
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_damageable_hit(node : Node, damage_amount : int, knockback_direction : Vector2):
	if(damageableb.health >0):
		character.velocity = knockback_speed * knockback_direction
		emit_signal("intrerupt_state", self)
	else:
		emit_signal("intrerupt_state",dead_state)
		playback.travel(dead_animation_node)


func on_exit():
	character.velocity = Vector2.ZERO


func _on_timer_timeout():
	next_state = return_state
