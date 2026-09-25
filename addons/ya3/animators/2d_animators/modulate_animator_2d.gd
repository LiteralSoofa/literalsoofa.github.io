@tool
extends Animator2D
class_name ModulateAnimator2D


@export var modulate_before: Color = Color.TRANSPARENT
@export var modulate_after: Color = Color.WHITE


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.modulate = modulate_after if reverse else modulate_before
	
	var property_tween := _tween.tween_property(
		parent,
		"modulate",
		modulate_before if reverse else modulate_after,
		duration
	)
	
	match loop:
		LoopType.LOOP:
			_tween.set_loops()
			_tween.tween_property(
				parent,
				"modulate",
				modulate_after if reverse else modulate_before,
				0
			)
		LoopType.REVERSE:
			var rev := _tween.tween_property(
				parent,
				"modulate",
				modulate_after if reverse else modulate_before,
				duration
			)
			rev.set_trans(transition_type)
			rev.set_ease(ease_type)
			_tween.set_loops()
	
	return property_tween
