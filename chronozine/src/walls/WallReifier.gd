class_name WallReifier
extends StaticBody2D


func _ready() -> void:
	for child in get_children():
		if "points" in child and child.points.size() > 1:
			_generate_collision_shapes(child.points)


func _generate_collision_shapes(points: PoolVector2Array) -> void:
	assert(points.size() >= 2)

	for i in points.size() - 1:
		var collision_node := CollisionShape2D.new()
		var segment := SegmentShape2D.new()
		segment.a = points[i+0]
		segment.b = points[i+1]
		collision_node.shape = segment
		add_child(collision_node, true)
