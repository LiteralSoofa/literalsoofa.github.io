@icon("res://addons/ya3/icons/animator_3d.png")
@abstract
extends Animator
class_name Animator3D

@onready var parent: Node3D = get_parent() as Node3D


func _ready() -> void:
	super._ready()


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	if not get_parent() is Node3D:
		warnings.append("This animator is a 3D animator, thus it will not work for it's current parent.")
	return warnings


func play_animation(reverse := false) -> void:
	if not parent:
		push_warning("[YA3] Animator3D has no valid Node3D parent.")
		return
	
	await super.play_animation(reverse)
