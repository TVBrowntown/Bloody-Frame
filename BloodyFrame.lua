BloodyFrame = {}

function BloodyFrame.OnInit()
	RegisterEventHandler(SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED, "BloodyFrame.SetAlpha")
	CreateWindowFromTemplate("BloodyFrame", "EA_DynamicImage_DefaultSeparatorRight", "Root")
	WindowClearAnchors("BloodyFrame")
	DynamicImageSetTexture("BloodyFrame", "BloodyFrame", 0, 0)
	DynamicImageSetTextureDimensions("BloodyFrame", 1028, 588)
	WindowSetDimensions("BloodyFrame", 1920, 1080)
	WindowSetScale("BloodyFrame", BloodyFrame.GetResolutionScale())
	WindowSetAlpha("BloodyFrame", 0)
	WindowSetShowing("BloodyFrame", false)
end

function BloodyFrame.SetAlpha()
	if 100 * ( GameData.Player.hitPoints.current / GameData.Player.hitPoints.maximum ) <= 20 then
		BFSetAlpha = 0.8
			else
		if 100 * ( GameData.Player.hitPoints.current / GameData.Player.hitPoints.maximum )  <= 30 then
			BFSetAlpha = 0.7
		else
			if 100 * ( GameData.Player.hitPoints.current / GameData.Player.hitPoints.maximum )  <= 45 then
				BFSetAlpha = 0.50
			else
				if 100 * ( GameData.Player.hitPoints.current / GameData.Player.hitPoints.maximum )  <= 60 then
					BFSetAlpha = 0.35
				else
					if 100 * ( GameData.Player.hitPoints.current / GameData.Player.hitPoints.maximum )  <= 70 then
						BFSetAlpha = 0.2
					else
						BFSetAlpha = 0
					end
				end
			end
		end
	end
	BloodyFrame.Animate()
end

function BloodyFrame.Shutdown()
	DestroyWindow("BloodyFrame")
end

function BloodyFrame.Test()
	BFSetAlpha = 1
	BloodyFrame.Animate()
end

function BloodyFrame.Clear()
	WindowSetShowing("BloodyFrame", false)
	WindowSetAlpha("BloodyFrame", 0)
	BFSetAlpha = 0
end

function BloodyFrame.Animate()
	if BFSetAlpha > 0 then
		WindowSetShowing("BloodyFrame", true)
		WindowSetAlpha("BloodyFrame", BFSetAlpha)
	else
		WindowSetShowing("BloodyFrame", false)
	end
end

function BloodyFrame.GetResolutionScale()
	return ((SystemData.screenResolution.x/1920)+(SystemData.screenResolution.y/1080))/2
end