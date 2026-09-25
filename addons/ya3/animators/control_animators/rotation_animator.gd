@tool
extends ControlAnimator
class_name RotationAnimator


@export var rotation_before: float = 0.0
@export var rotation_after: float = 360.0


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.offset_transform_enabled = true
	parent.offset_transform_pivot_ratio = Vector2(0.5, 0.5)

	parent.offset_transform_rotation = rotation_after if reverse else rotation_before
	
	var property_tween := _tween.tween_property(
		parent,
		"offset_transform_rotation",
		rotation_before if reverse else rotation_after,
		duration
	)
	
	match loop:
		LoopType.LOOP:
			_tween.set_loops()
			_tween.tween_property(
				parent,
				"offset_transform_rotation",
				rotation_after if reverse else rotation_before,
				0
			)
		LoopType.REVERSE:
			var rev := _tween.tween_property(
				parent,
				"offset_transform_rotation",
				rotation_after if reverse else rotation_before,
				duration
			)
			rev.set_trans(transition_type)
			rev.set_ease(ease_type)
			_tween.set_loops()
	
	return property_tween
