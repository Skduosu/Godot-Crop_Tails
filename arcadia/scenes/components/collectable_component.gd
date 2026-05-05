class_name CollectableComponent
extends Area2D

# 将该方法封装，以便外部脚本复用
@export var collectable_name : String


# 掉落物品收集
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("收起掉落物品！！！")
		# 物品收集之后，掉落物要隐藏
		get_parent().queue_free()
