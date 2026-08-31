class_name StateMachine 
extends Node

var current_state: int = -1:
    set(v):
        owner.transiton_state(current_state, v)
        current_state = v

func _ready():
    await owner.ready
    current_state = 0

func _physics_process(delta):
    while true:
        var next = owner.get_next_state(current_state)
        if current_state == next:
            break
        current_state = next

    owner.tick_physics(current_state, delta)
