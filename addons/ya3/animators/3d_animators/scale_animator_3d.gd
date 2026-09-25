@tool
extends Animator3D
class_name ScaleAnimator3D


@export var scale_before: Vector3 = Vector3.ZERO
@export var scale_after: Vector3 = Vector3.ONE


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.scale = scale_after if reverse else scale_before
	
	var property_tween := _tween.tween_property(
		parent,
		"scale",
		scale_before if reverse else scale_after,
		duration
	)
	
	match loop:
		LoopType.LOOP:
			_tween.set_loops()
			_tween.tween_property(
				parent,
				"scale",
				scale_after if reverse else scale_before,
				0
			)
		LoopType.REVERSE:
			var rev := _tween.tween_property(
				parent,
				"scale",
				scale_after if reverse else scale_before,
				duration
			)
			rev.set_trans(transition_type)
			rev.set_ease(ease_type)
			_tween.set_loops()
	
	return property_tween
