extends Label


@export var state_machine: Characterstatemachine
func _process(delta):
	text = "State : " + state_machine.current_state.name
