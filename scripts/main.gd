extends Control
class_name Main


func _ready() -> void:
	Input.set_custom_mouse_cursor(preload("res://assets/kenney_cursor-pack/Vector/Outline/cursor_none.svg"))
	Input.set_custom_mouse_cursor(preload("res://assets/kenney_cursor-pack/Vector/Outline/hand_point.svg"), Input.CURSOR_POINTING_HAND)
