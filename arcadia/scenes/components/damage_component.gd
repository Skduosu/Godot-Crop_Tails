class_name DamageComponent
extends Node2D

# 每次击打造成的伤害 = 1
@export var max_damage = 1
# 初始伤害
@export var current_damage = 0

# 血量
signal max_damaged_reached

func apply_damage(damage: int) -> void:
	current_damage = clamp(current_damage + damage, 0, max_damage)
	print("小树正在被攻击")
	
	if current_damage == max_damage:
		print("原木掉落了！！！")
		max_damaged_reached.emit()
