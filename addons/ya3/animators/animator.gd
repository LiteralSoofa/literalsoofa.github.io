@abstract
extends Node
class_name Animator

@export_range(0, 60, 0.01, "or_greater", "hide_control")
var duration: float = 1.0
@export_range(0, 60, 0.01, "or_greater", "hide_control")
var delay: float = 0

@export var transition_type: Tween.TransitionType = Tween.TRANS_LINEAR
@export var ease_type: Tween.EaseType = Tween.EASE_IN_OUT
@export var play_on_ready: bool = false
@export var loop: LoopType = LoopType.NO_LOOP

var _tween: Tween

var is_playing: bool:
	get:
		return _tween != null and _tween.is_valid()


enum LoopType {
	NO_LOOP,
	LOOP,
	REVERSE
}

func _ready() -> void:
	if not get_parent():
		push_error("[YA3] An animator must have a parent node.")
		return
	
	if play_on_ready:
		play_animation()


func play_animation(reverse := false) -> void:
	if _tween:
		_tween.kill()
	
	_tween = create_tween()
	
	_tween.tween_interval(delay)
	var property_tween := _animation_implementation(reverse)
	property_tween.set_trans(transition_type)
	property_tween.set_ease(ease_type)
	
	if loop == LoopType.NO_LOOP:
		await _tween.finished
		_tween = null
	


func stop_animation() -> void:
	if _tween:
		_tween.kill()
		_tween = null


@abstract
func _animation_implementation(reverse := false) -> PropertyTweener
