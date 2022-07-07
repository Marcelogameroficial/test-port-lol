
function onCreate()
    setProperty('gfGroup.visible', false)
    runTimer('e', 0.1)
end

function onTimerCompleted(name)
    if name == 'e' then
        triggerEvent('Camera Follow Pos', '610', '570')
    end
end

