extends Node


const HOME_SCN := preload("res://src/gui/screens/home/Home.tscn")

# If we don't have a controller, a mouse is the best option
var is_using_mouse := Input.get_connected_joypads().empty()
