function opponentNoteHit(id, direction, noteType, isSustainNote)
	if isSustainNote == false then
		if direction==0 then
				cancelTween('revert')
				setProperty('camHUD.angle', 0)
				setProperty('camHUD.y', 0)
				setProperty('camHUD.angle', -5)
				doTweenAngle('revert', 'camHUD', 0, 0.3, 'CircOut')
		elseif direction==1 then
				cancelTween('revert')
				setProperty('camHUD.angle', 0)
				setProperty('camHUD.y', 0)
				setProperty('camHUD.y', 25)
				doTweenY('revert', 'camHUD', 0, 0.3, 'CircOut')
		elseif direction==2 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.y', -25)
			doTweenY('revert', 'camHUD', 0, 0.3, 'CircOut')
		elseif direction==3 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.angle', 5)
			doTweenAngle('revert', 'camHUD', 0, 0.3, 'CircOut')
		end
	end
end