
local xx = 1000;
local yy = 750;
local xx2 = 1400;
local yy2 = 750;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
local drain = 0.01 -- the funnelocal angleshit = 1;
local anglevar = 1;


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)

        else
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.2 then
        setProperty('health', health- 0.018);
    end
end

function onBeatHit()
    if curBeat > 256 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'quadOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'quadIn')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'quadOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'quadIn')
    end
end


function onCreate()
    makeLuaText('watermark', songName .. " | Song Created By Hayseed Here", 0, 2, 700); -- You can edit the created by Prisma Text just dont change anything else
        setTextSize('watermark', 20);
        addLuaText('watermark');
    end

    stepHitFuncs = { --All has been code for Bycach_broy and some scripts examples. If you are going to use it please consider leaving me credits. Thanks

    [512] = function() --CurStep Number, NOT BEATS
        setProperty('bgeffect.visible', true)
    end,
    
    
    [768] = function() --CurStep Number, NOT BEATS
        setProperty('whitebackground.visible', true)
        setProperty('bgeffect.visible', false)
    end,
    
    [1024] = function() --CurStep Number, NOT BEATS
        setProperty('whitebackground.visible', false)
        setProperty('stewieroom2.visible', true)
        setProperty('bgeffect.visible', true)
    end,
    }
    
    function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() -- Executes function at curStep in stepHitFuncs
    end
    end
    