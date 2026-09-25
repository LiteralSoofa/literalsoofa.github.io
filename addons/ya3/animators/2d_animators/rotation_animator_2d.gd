@tool
extends Animator2D
class_name RotationAnimator2D


@export var rotation_before: float = 0.0
@export var rotation_after: float = 360.0


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.rotation_degrees = rotation_after if reverse else rotation_before
	
	var property_tween := _tween.tween_property(
		parent,
		"rotation_degrees",
		rotation_before if reverse else rotation_after,
		duration
	)
	
	match loop:
		LoopType.LOOP:
			_tween.set_loops()
			_tween.tween_property(
				parent,
				"rotation_degrees",
				rotation_after if reverse else rotation_before,
				0
			)
		LoopType.REVERSE:
			var rev := _tween.tween_property(
				parent,
				"rotation_degrees",
				rotation_after if reverse else rotation_before,
				duration
			)
			rev.set_trans(transition_type)
			rev.set_ease(ease_type)
			_tween.set_loops()
	
	return property_tween
