extends RichTextLabel
class_name StateText

func _process(_delta: float) -> void:
	text = str(get_parent().get_node("StateMachine").currentState)
