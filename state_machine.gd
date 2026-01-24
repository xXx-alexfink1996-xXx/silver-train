@abstract
class_name StateMachine
extends Node

@export var starting_state: State

var current_state: State

#Initialize: give each child state a ref to parent & enter default state
func init(parent: CharacterBody3D, animations: AnimationPlayer) -> void:
	for child in get_children():
		child.parent = parent
		child.animations = animations
	
	change_state(starting_state)


#Change state by first calling exit logic on current state
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()


#Pass thru funcs for parent to call, handling state change if needed
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)


func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

