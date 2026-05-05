# 绑定静止状态
extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

# var direction: Vector2

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	# direction = GameInputEvents.movement_input()
		
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	else:
		animated_sprite_2d.play("idle_front")

# 动画切换
func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	# 如果当前有输入的状态，则切换行走的动画
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
		
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
			transition.emit("Chopping")
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		transition.emit("Tilling")
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		transition.emit("Watering")


func _on_enter() -> void:
	pass

# 停止播放动画，并且保持当前方向
func _on_exit() -> void:
	animated_sprite_2d.stop()
