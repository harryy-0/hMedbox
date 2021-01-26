	AddCSLuaFile("imgui.lua")
	include("config.lua")

	local imgui = include("imgui.lua")
	include("shared.lua")

ENT.RenderGroup = RENDERGROUP_BOTH

	function ENT:DrawTranslucent()


		if imgui.Entity3D2D(self, Vector(-5, -4, 6), Angle(0, 90, 0), 0.1, 550, 200) then

		-- Main box
		surface.SetDrawColor(135, 135, 135)
		surface.DrawRect(-115, -100, 300, 300)


		--Draws title
		draw.RoundedBox(0, -115, -40, 300, -20, HCONFIG.PropColor)
		draw.SimpleText("Med Station", imgui.xFont("!Roboto@30"), -25, -93)

	local ply = LocalPlayer()



		--HP Button
			if ply:canAfford(HCONFIG.HealthPrice) then 
			draw.SimpleText(HCONFIG.HealthPrice, imgui.xFont("!Roboto@30"), 10, -40)
			draw.SimpleText(HCONFIG.Currency, imgui.xFont("!Roboto@30"), -5, -41)
			 if imgui.xTextButton("Health", "!Roboto@24", -90, -8, 250, 75, 1, HCONFIG.ButtonColor , HCONFIG.HoverButtonColor, HCONFIG.PressButtonColor) then
		      if ply:Health() < 100 then
		     	chat.AddText(Color( 59, 59, 59 ), "Server | ",Color(255,255,255), "You have purchased health, it cost " .. HCONFIG.Currency .. HCONFIG.HealthPrice)
		     	net.Start( "HP" )
		    	net.SendToServer()
		     else
		    	chat.AddText(Color( 59, 59, 59 ), "Server | ", Color( 255, 255, 255 ), "You are already full health")
		  			end
				end
			
			else
 			if imgui.xTextButton("Can't afford", "!Roboto@24", -90, -8, 250, 75, 1, Color(255, 255, 255) , Color(255, 255, 255), Color(255, 255, 255)) then
				 end
			end
		--HP Button
     	if ply:canAfford(HCONFIG.ArmorPrice) then 
		 draw.SimpleText(HCONFIG.ArmorPrice, imgui.xFont("!Roboto@30"), 10, 70)
		 draw.SimpleText(HCONFIG.Currency, imgui.xFont("!Roboto@30"), -5, 69)
		 if imgui.xTextButton("Armour", "!Roboto@24", -90, 100, 250, 75, 1, HCONFIG.ButtonColor , HCONFIG.HoverButtonColor, HCONFIG.PressButtonColor) then
	      if ply:Armor() < 100 then
	     	chat.AddText(Color( 59, 59, 59 ), "Server | ",Color(255,255,255), "You have purchased armour, it cost "  .. HCONFIG.Currency .. HCONFIG.ArmorPrice)
	     	net.Start( "Armour" )
	    	net.SendToServer()
	     else
	    	chat.AddText(Color( 59, 59, 59 ), "Server | ", Color( 255, 255, 255 ), "You are already full armour")
	 	 end

	end
		else
			if imgui.xTextButton("Can't afford", "!Roboto@24",-90, 100, 250, 75, 1, Color(255, 255, 255) , Color(255, 255, 255), Color(255, 255, 255)) then
				 end	

end
imgui.End3D2D()
	
end


		
	

end




