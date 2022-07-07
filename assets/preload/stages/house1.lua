

function onCreate()
	makeAnimatedLuaSprite('house1', 'house1', -600, -300);
	scaleObject('house1', 0.9, 0.9);
	addAnimationByPrefix('house1', ' ', ' ',  24, true);
    addLuaSprite('house1',false)
	objectPlayAnimation('house1', 'one', true)

	makeAnimatedLuaSprite('glitch', 'static', -600, -300);
	scaleObject('glitch', 3, 3);
	addAnimationByPrefix('glitch', 'glitchout', 'static glitch', 24, true);
	objectPlayAnimation('glitch', 'glitchout');
	addLuaSprite('glitch', true);

	makeAnimatedLuaSprite('pibby', 'Pibby',1200, 500)
	scaleObject('pibby', 0.9, 0.9);
	addAnimationByPrefix('pibby', 'bounce', 'Pibby Idle',24,true)
	addLuaSprite('pibby',true)

	makeAnimatedLuaSprite('house2', 'house2', -600, -300);
	scaleObject('house2', 0.9, 0.9);
	addAnimationByPrefix('house2', ' ', ' ',  24, true);
    addLuaSprite('house2',false)
	objectPlayAnimation('house2', 'one', true)

	setProperty('house2.visible', false)

	function onBeatHit()
		if curBeat % 2 == 0 then
			objectPlayAnimation('pibby', 'bounce', 'Pibby Idle',24,true)
		end
	end
    close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

	