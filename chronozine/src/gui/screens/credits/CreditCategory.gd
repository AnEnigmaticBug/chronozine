tool
class_name CreditCategory
extends VBoxContainer


export var category := ""
export var credits: PoolStringArray = []


func _ready() -> void:
	$Heading.text = category + ":"

	for credit in credits:
		var node := RichTextLabel.new()
		node.fit_content_height = true
		node.bbcode_enabled = true
		node.bbcode_text = "      " + credit
		add_child(node)
		
		node.connect("meta_clicked", self, "_on_Credit_meta_clicked")


func _on_Credit_meta_clicked(meta: String) -> void:
	OS.shell_open(meta)
