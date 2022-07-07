function onCreate()

end

function onStepHit()

if curStep == 512 then

    setProperty('gf.x', 1200)
    setProperty('gf.y', 400)
end

if curStep == 1024 then
   setProperty('boyfriend.y', 420)
end
end