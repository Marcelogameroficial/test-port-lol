local credit = 0

local ffi = require("ffi")  -- LuaJIT Extension
local user32 = ffi.load("user32")   -- LuaJIT User32 DLL Handler Function

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
    MB_OKCANCEL = 0x00000001L,
    MB_ABORTRETRYIGNORE = 0x00000002L,
    MB_YESNOCANCEL = 0x00000003L,
    MB_YESNO = 0x00000004L,
    MB_RETRYCANCEL = 0x00000005L,
    MB_CANCELTRYCONTINUE = 0x00000006L,
    MB_ICONINFORMATION = 0x00000040L,
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
int MessageBoxW(HWND, LPCSTR, LPCSTR, UINT);
]])

function onCreate()
	
	if flashingLights ~= false then
		makeLuaSprite('lose', 'loseCredit', 0, 0)
		makeLuaSprite('win', 'plusCredit', 0, 0)
		setObjectCamera('lose', 'camHUD')
		setObjectCamera('win', 'camHUD')
		scaleObject('lose', 0.67, 0.67)
		scaleObject('win', 0.67, 0.67)
		addLuaSprite('lose', false)
		addLuaSprite('win', false)
		setProperty('lose.alpha', 0)
		setProperty('win.alpha', 0)
	end

	makeLuaSprite('bing', 'bingChilling', 0, 0)
	scaleObject('bing', 1.3, 0.7)
	setObjectCamera('bing', 'hud')
	addLuaSprite('bing', true)
	setProperty('bing.alpha', 0)

	makeLuaSprite('promptGood', 'prompt1', 0, 0)
	makeLuaSprite('promptBad', 'prompt2', 0, 0)
	setObjectCamera('promptGood', 'camHUD')
	setObjectCamera('promptBad', 'camHUD')
	scaleObject('promptGood', 0.67, 0.67)
	scaleObject('promptBad', 0.67, 0.67)
	addLuaSprite('promptGood', true)
	addLuaSprite('promptBad', true)
	setProperty('promptGood.alpha', 0)
	setProperty('promptBad.alpha', 0)

    makeLuaText('creditNum', credit, 400, 524, 569.2)    
    setTextSize('creditNum', 20)
    setTextAlignment('creditNum', 'left')
    addLuaText('creditNum')
end

function onUpdate()
    setTextString('creditNum', 'Social Credit:'..credit)
	    if curStep >896 and curStep <1152 then
    local currentBeat = (getSongPosition() / 1000)*(bpm/80)

		for sinenote = 0, 3 do
        setPropertyFromGroup('playerStrums', sinenote, 'y', _G['defaultPlayerStrumY'..sinenote] + 120*math.cos((currentBeat+(sinenote * 15)*0.25)))
        setPropertyFromGroup('opponentStrums', sinenote, 'y', _G['defaultOpponentStrumY'..sinenote] + 120*math.cos((currentBeat+(sinenote * 15)*0.25)))
		end
    end

	if credit <0 then
		setProperty('health', -10)
	end

	if getProperty('bing.alpha') == 1 then
		setProperty('health', -1)
	end
end

function onGameOver()
	user32.MessageBoxA(nil, "    system32.restart_failed", "p.rank_em/jon", ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
    
    if ffi.C.MB_OK then
      debugPrint('pranked')
    end
end

function onStepHit()
	if curStep == 16 then
		doTweenAlpha('p1In', 'promptGood', 1, 0.7)
	end
	if curStep == 64 then
		doTweenAlpha('p1Out', 'promptGood', 0, 0.5)
		doTweenAlpha('p2In', 'promptBad', 1, 0.7)
		playSound('vine', 0.7)
	end
	if curStep == 112 then
		doTweenAlpha('p2Out', 'promptBad', 0, 0.5)
	end

	if curStep == 1152 then
		if downscroll == false then
			for note=0,7 do
				noteTweenY('strumEnd'..note, note, 50, 0.3)
			end
		else
			for note=0,7 do
				noteTweenY('strumEnd'..note, note, 619, 0.3)
			end		
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'increaseNote' and isSustainNote == false then
		credit = credit + 1
		setProperty('lose.alpha', 0)
		setProperty('win.alpha', 0.5)
		doTweenAlpha('winBye', 'win', 0, 0.3)
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'decreaseNote' then
		credit = credit - 2
		setProperty('win.alpha', 0)
		setProperty('lose.alpha', 0.6)
		doTweenAlpha('loseBye', 'lose', 0, 0.4)
		playSound('vine', 0.5)
	end
	setProperty('bing.alpha', getProperty('bing.alpha') + 0.1)
end
	
