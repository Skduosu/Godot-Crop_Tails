# 绑定劈砍动作的节点
extends NodeState

# 导出玩家组件
@export var player: Player
# 导出动画精灵组件
@export var animated_sprite_2d: AnimatedSprite2D
# 击打组件
@export var hit_component_collision_shape : CollisionShape2D


func _ready() -> void:
	# 初始形态是否设置为关闭
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 0)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass

# 检测当前有无动画正在播放
func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")

# 播放动画
func _on_enter() -> void:
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("chopping_back")
		hit_component_collision_shape.position = Vector2(0, -22)
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("chopping_right")
		hit_component_collision_shape.position = Vector2(11, 0)
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("chopping_front")
		hit_component_collision_shape.position = Vector2(0, 3)
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("chopping_left")
		hit_component_collision_shape.position = Vector2(-11, 0)
	else:
		animated_sprite_2d.play("chopping_front")
		hit_component_collision_shape.position = Vector2(0, 3)
	
	# 当检测到激活状态时
	hit_component_collision_shape.disabled = false

# 停止播放动画
func _on_exit() -> void:
	animated_sprite_2d.stop()
	hit_component_collision_shape.disabled = true
	
	
