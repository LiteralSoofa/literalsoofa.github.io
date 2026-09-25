extends ControlAnimator
class_name SlideAnimator


@export var direction: Vector2 = Vector2(-1, 0)


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.offset_transform_enabled = true
	var direction_factor: float = (max(get_viewport().get_visible_rect().size.x, get_viewport().get_visible_rect().size.y) + max(parent.size.x, parent.size.y)) / 2
	
	var property_tween := _tween.tween_property(
		parent,
		"offset_transform_position",
		parent.offset_transform_position if reverse else direction * direction_factor,
		duration
	)
	
	match loop:
		LoopType.LOOP:
			_tween.set_loops()
			_tween.tween_property(
				parent,
				"offset_transform_position",
				direction * direction_factor if reverse else parent.offset_transform_position,
				0
			)
		LoopType.REVERSE:
			var rev := _tween.tween_property(
				parent,
				"offset_transform_position",
				direction * direction_factor if reverse else parent.offset_transform_position,
				duration
			)
			rev.set_trans(transition_type)
			rev.set_ease(ease_type)
			_tween.set_loops()
	
	return property_tween
