function onCreate()
	getProperty('health')
	setProperty('health', 2)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') >0.23 then
		setProperty('health', getProperty('health')-0.03)
	end
end