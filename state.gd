@abstract
class_name State
extends Node

@export var animation_name: String


#Hold a ref to the parent so it can be state controlled
var parent: CharacterBody3D
var animations: AnimationPlayer

func enter() -> void:
	if animations == null:
		return
	animations.play(animation_name)

func exit() -> void:
	pass
	

func process_input(event: InputEvent) -> State:
	return null


func process_frame(delta: float) -> State:
	return null


func process_physics(delta: float) -> State:
	return null

