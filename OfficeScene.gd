extends Node2D

func set_active(active: bool):
	self.set_process(active)
	self.set_physics_process(active)
	self.set_process_input(active)
	self.visible = active
	$OfficeCanvasLayer.set_process(active)
	$OfficeCanvasLayer.set_physics_process(active)
	$OfficeCanvasLayer.set_process_input(active)
	$OfficeCanvasLayer.visible = active
	$OfficeCamera2D.set_process(active)
	$OfficeCamera2D.set_physics_process(active)
	$OfficeCamera2D.set_process_input(active)
	$OfficeCamera2D.visible = active
