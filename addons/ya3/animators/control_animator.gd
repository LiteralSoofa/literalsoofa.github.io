@icon("res://addons/ya3/icons/control_animator.png")
@abstract
extends Animator
class_name ControlAnimator

@onready var parent: Control = get_parent() as Control


func _ready() -> void:
	super._ready()


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	if not get_parent() is Control:
		warnings.append("This animator is a control animator, thus it will not work for it's current parent.")
	return warnings


func play_animation(reverse := false) -> void:
	if not parent:
		push_warning("[YA3] ControlAnimator has no valid Control parent.")
		return
	
	await super.play_animation(reverse)
