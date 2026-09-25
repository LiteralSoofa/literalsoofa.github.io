@icon("res://addons/ya3/icons/animator_2d.png")
@abstract
extends Animator
class_name Animator2D

@onready var parent: Node2D = get_parent() as Node2D


func _ready() -> void:
	super._ready()


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	if not get_parent() is Node2D:
		warnings.append("This animator is a 2D animator, thus it will not work for it's current parent.")
	return warnings


func play_animation(reverse := false) -> void:
	if not parent:
		push_warning("[YA3] Animator2D has no valid Node2D parent.")
		return
	
	await super.play_animation(reverse)
