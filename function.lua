function set_combinators(count, factor, area_id, signal_name, NN_id)
    local entity = "constant-combinator"
    local surface = game.player.surface
    local area = game.get_surface("nauvis").get_script_area(signal_name .. area_id).area
    
    entities = surface.find_entities_filtered({area=area, force=game.player.force,name=entity})
    table.sort(entities, function (e1, e2)
    if e1.position.y == e2.position.y then
        return e1.position.x < e2.position.x
    end
    return e1.position.y < e2.position.y
    end
    )
    for key, ent in pairs(entities) do
        local signal = {signal={type="virtual", name="signal-" .. signal_name}, count=count[key] * factor}
        ent.get_or_create_control_behavior().set_signal(1, signal)
    end
end