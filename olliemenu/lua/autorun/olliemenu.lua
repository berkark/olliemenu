if SERVER then
 
    util.AddNetworkString("ollie_Menu")
 
    function loadMenu( ply )
        net.Start("ollie_Menu")
        --empty
        net.Send(ply)
    end
    hook.Add("PlayerInitialSpawn" , "Ollie's menu" , loadMenu)
 
elseif CLIENT then

	surface.CreateFont( "trebuchet60", {
		font = "Trebuchet MS", 
		size = ScreenScale(20),
		weight = 500,
		antialias = true,
	} )

	surface.CreateFont( "trebuchet50", {
		font = "Trebuchet MS", 
		size = ScreenScale(17),
		weight = 500,
		antialias = true,
	} )

    function OllieMenu()
		local frame = vgui.Create("DFrame")
		frame:ShowCloseButton("false")
		frame:SetSize(ScrW() * 0.39062,ScrH() * 0.78703)
		frame:Center()
		frame:SetTitle("")
		frame:MakePopup()
		frame:SetDraggable("false")
		function frame.Paint(s,w,h)

			draw.RoundedBox(0,0,0,w,h,Color(255,255,30))
			draw.RoundedBox(0,5,5,w-10,h-10,Color(0,0,0))
			draw.RoundedBox(0,7,7,w-14,h-14,Color(60,60,60))

		end

		local image = vgui.Create("DImageButton",frame)
		image:SetImage( "olliematerial/jedi.png" )
		image:SetPos(ScrW() * 0.03125,ScrH() * 0.18518)
		image:SetSize(ScrW() * 0.130208, ScrH() * 0.23148)
		function image.DoClick()

			frame:Close()
			LocalPlayer():ConCommand("say /jedi")

		end

		local image2 = vgui.Create("DImageButton",frame)
		image2:SetImage( "olliematerial/sith.png" )
		image2:SetPos(ScrW() * 0.234375,ScrH() * 0.18518)
		image2:SetSize(ScrW() * 0.11979,ScrH() * 0.24537)
		function image2.DoClick()

			frame:Close()
			LocalPlayer():ConCommand("say /sith")

		end

		local image3 = vgui.Create("DImageButton",frame)
		image3:SetImage( "olliematerial/jedi.png" )
		image3:SetPos(ScrW() * 0.03125, ScrH() * 0.50925)
		image3:SetSize(ScrW() * 0.13020, ScrH() * 0.23148)
		function image3.DoClick()

			frame:Close()
			LocalPlayer():ConCommand("say /republic")

		end

		local image4 = vgui.Create("DImageButton",frame)
		image4:SetImage( "olliematerial/sith.png")
		image4:SetPos(ScrW() * 0.23437,ScrH() * 0.50925)
		image4:SetSize(ScrW() * 0.11979,ScrH() * 0.24537)
		function image4.DoClick()

			frame:Close()
			LocalPlayer():ConCommand("say /imperial")

		end
		--[[
		local panel = vgui.Create("DPanel",frame)
		panel:SetSize(350,50)
		panel:SetPos(205,25)
		panel:SetBackgroundColor(Color(255,255,0,50))
		--]]

		local text = vgui.Create("DLabel",frame)
		text:SetText("Select a Faction")
		text:SetFont("trebuchet60")
		text:SetPos(ScrW() * 0.10937 ,ScrH() * 0)
		text:SetSize(ScrW() * 0.20833,ScrH() * 0.09259)
		text:SetTextColor(Color(255,255,0))

		local header = vgui.Create("DLabel",frame)
		header:SetText("Jedi")
		header:SetFont("trebuchet50")
		header:SetPos(ScrW() * 0.07552,ScrH() * 0.10185)
		header:SetSize(ScrW() * 0.10416,ScrH() * 0.09259)
		header:SetTextColor(Color(0,128,255))

		local header2 = vgui.Create("DLabel",frame)
		header2:SetText("Sith")
		header2:SetFont("trebuchet50")
		header2:SetPos(ScrW() * 0.27604,ScrH() * 0.10185)
		header2:SetSize(ScrW() * 0.10416,ScrH() * 0.09259)
		header2:SetTextColor(Color(255,51,51))

		local header3 = vgui.Create("DLabel",frame)
		header3:SetText("Republic")
		header3:SetFont("trebuchet50")
		header3:SetPos(ScrW() * 0.05729,ScrH() * 0.42592)
		header3:SetSize(ScrW() * 0.10416,ScrH() * 0.09259)
		header3:SetTextColor(Color(0,128,255))

		local header4 = vgui.Create("DLabel",frame)
		header4:SetText("Imperial")
		header4:SetFont("trebuchet50")
		header4:SetPos(ScrW() * 0.25781,ScrH() * 0.42592)
		header4:SetSize(ScrW() * 0.10416,ScrH() * 0.09259)
		header4:SetTextColor(Color(255,51,51))

		print("OllieMenu is loaded.")
	end
 
    net.Receive( "ollie_Menu" , function(len)
        OllieMenu()
    end)
end