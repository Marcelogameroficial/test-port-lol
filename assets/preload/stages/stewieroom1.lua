

function onCreate()
	makeAnimatedLuaSprite('stewieroom1', 'stewieroom1', -100, -100);
	scaleObject('stewieroom1', 0.85, 0.85);
	addAnimationByPrefix('stewieroom1', ' ', ' ',  24, true);
    addLuaSprite('stewieroom1',false)
	objectPlayAnimation('stewieroom1', 'one', true)

	makeAnimatedLuaSprite('glitch', 'static', -600, -300);
	scaleObject('glitch', 3, 3);
	addAnimationByPrefix('glitch', 'glitchout', 'static glitch', 24, true);
	objectPlayAnimation('glitch', 'glitchout');
	addLuaSprite('glitch', true);

	makeAnimatedLuaSprite('bgeffect', 'bgeffect', 0, -100);
	scaleObject('bgeffect', 1, 1);
	addLuaSprite('bgeffect',true)
	addAnimationByPrefix('bgeffect', ' ', ' ',  24, true);
	objectPlayAnimation('bgeffect', 'effect', true)
	setProperty('bgeffect.visible', false)

	makeAnimatedLuaSprite('whitebackground', 'whitebackground', 0, 0);
	scaleObject('whitebackground', 2, 2);
	addLuaSprite('whitebackground',false)
	addAnimationByPrefix('whitebackground', ' ', ' ',  24, true);
	objectPlayAnimation('whitebackground', 'one', true)

	setProperty('whitebackground.visible', false)
	makeAnimatedLuaSprite('stewieroom2', 'stewieroom2', -100, -100);
	scaleObject('stewieroom2', 0.85, 0.85);
	addAnimationByPrefix('stewieroom2', ' ', ' ',  24, true);
	addLuaSprite('stewieroom2',false)
	objectPlayAnimation('stewieroom2', 'one', true)
	setProperty('stewieroom2.visible', false)


close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage


end
