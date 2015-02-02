Framer.Device.contentScale = 1



# This imports all the layers for "setupweb_JITLearn" into setupweb_jitlearnLayers
layers = Framer.Importer.load "imported/setupweb_JITLearn"



# Variables
screenHeight = Framer.Device.screen.height
screenWidth = Framer.Device.screen.width



# Document Setup
document.body.style.cursor = "auto"
bg = new BackgroundLayer 
	backgroundColor: "white"

layers.Guide.visible = false	
layers.SuccessTick.visible = false
tutorial = 0





# Setup Form
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
startForm = ->
	
	layers.SetupProgress.y = screenHeight - 70
	layers.SetupProgress.width = screenWidth
	layers.ProgressBG.width = screenWidth
	layers.Progress1.centerX()
	layers.Progress1.pixelAlign()
	layers.ProgressBG.opacity = 0
	
		
	# Form Styling
	layers.Form.height = screenHeight
	layers.Form.width = screenWidth
	layers.FormBG.height = screenHeight
	layers.FormBG.width = screenWidth
	layers.FormContent.centerX()
	layers.FormContent.centerY(-20)
	layers.FormHeader.centerX()
	
	
	# Form Textinputs
	BizNameText = new Layer
	BizNameText.superLayer = layers.BizName
	BizNameText.height = layers.BizName.height
	BizNameText.width = layers.BizName.width
	BizNameText.backgroundColor = 'transparent'
	BizNameText.html = "<input type='text' style='padding:16px; width:100%;font-size:16px;color:RGBA(170, 200, 200, 1);background-color:transparent;' placeholder='Business Name...'></input>"
	BizNameText.style["border"] = "1px solid transparent"
	
	
	
	PasswordText = new Layer
	PasswordText.superLayer = layers.Password
	PasswordText.height = layers.BizName.height
	PasswordText.width = layers.BizName.width
	PasswordText.backgroundColor = 'transparent'
	PasswordText.html = "<input type='text' style='padding:16px; width:100%;font-size:16px;color:RGBA(170, 200, 200, 1);background-color:transparent;' placeholder='Password...'></input>"
	PasswordText.style["border"] = "1px solid transparent"
	
	
	
	BizTypeText = new Layer
	BizTypeText.superLayer = layers.BizType
	BizTypeText.height = layers.BizName.height
	BizTypeText.width = layers.BizName.width
	BizTypeText.backgroundColor = 'transparent'
	BizTypeText.html = "<input type='text' style='padding:16px; width:100%;font-size:16px;color:RGBA(170, 200, 200, 1);background-color:transparent;' placeholder='Business Type...'></input>"
	BizTypeText.style["border"] = "1px solid transparent"
	
	
	
	LocationText = new Layer
	LocationText.superLayer = layers.Location
	LocationText.height = layers.BizName.height
	LocationText.width = layers.BizName.width
	LocationText.backgroundColor = 'transparent'
	LocationText.html = "<input type='text' style='padding:16px; width:100%;font-size:16px;color:RGBA(170, 200, 200, 1);background-color:transparent;' placeholder='Where do you pay tax?'></input>"
	LocationText.style["border"] = "1px solid transparent"
	
	
	
	TaxText = new Layer
	TaxText.superLayer = layers.Tax
	TaxText.height = layers.BizName.height
	TaxText.width = layers.BizName.width
	TaxText.backgroundColor = 'transparent'
	TaxText.html = "<input type='text' style='padding:16px; width:100%;font-size:16px;color:RGBA(170, 200, 200, 1);background-color:transparent;' placeholder='Do you collect Sales Tax?'></input>"
	TaxText.style["border"] = "1px solid transparent"

	
	# Continue Button Interactions
	layers.ContButtonLoad.visible = false
	layers.ContButton.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
		layers.ContButton.opacity = 0.8
	
	layers.ContButton.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
		layers.ContButton.opacity = 1
	
	layers.Spinner.scale = 0
	layers.ContButton.on Events.Click, ->
		layers.ContButtonLoad.visible = true
		layers.Spinner.animate
			properties:
				scale: 1
			curve:"spring(200,15,0)"
		layers.Spinner.animate
			properties:
				rotation:1000
			time: 0.9
		layers.Spinner.on Events.AnimationEnd, ->
			layers.Spinner.animate
				properties:
					scale: 0.1
				curve:"spring(500,15,0)"
		utils.delay 1, ->
			startGuide1Intro()





		
	

# Guides Start
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––


startGuidesIndex = ->
	layers.Guide.bringToFront()
	layers.Guide.scale = 1
	layers.Guide.visible = true	
	layers.Dash.visible = false
	layers.Guide1Open.visible = true
	layers.SuccessTick.visible = false
	layers.Guide1Open.opacity = 1
	
	layers.Guide.height = screenHeight
	layers.Guide.width = screenWidth
	layers.GuideBG.width = screenWidth
	layers.GuideBG.height = screenHeight
	
	
	layers.GuideHeader1.centerX()
	layers.GuideHeader2.centerX()
	
	
	if tutorial == 1 
		layers.GuideHeader2.visible = true
		layers.GuideHeader1.visible = false
	else	
		layers.GuideHeader2.visible = false
		layers.GuideHeader1.visible = true
	

	
	# fade in the content
	layers.Guide.opacity = 0
	layers.Guide.animate
		properties:
			opacity:1
		curve:"ease"
		time: 0.5
	
	
	# Animate Guide 1 in
	layers.Guide1.centerX()
	layers.Guide1.centerY()
	layers.Guide1.pixelAlign()
	Guide1XOrigin = layers.Guide1.x
	Guide1YOrigin = layers.Guide1.y
	
	layers.Guide1.y = 3000
	layers.Guide1.animate
		properties:
			x: Guide1XOrigin
			y: Guide1YOrigin
		curve:"spring(150,25,0)"
	
	
	# Animate Guide 2 in
	layers.Guide2.x = layers.Guide1.x + layers.Guide1.width

	layers.Guide2.centerY()
	layers.Guide2.pixelAlign()
	Guide2YOrigin = layers.Guide2.y
	
	layers.Guide2.y = 3000
	layers.Guide2.opacity = 0.9
	layers.Guide2.animate
		properties:
			y: Guide2YOrigin
		curve:"spring(130,25,0)"
	
	# click interactions
	layers.Guide1Go.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
		layers.Guide1Go.animate
			properties:
				scale: 1.05
			curve:"spring(600,15,0)"
	
	layers.Guide1Go.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
		layers.Guide1Go.animate
			properties:
				scale: 1
			curve:"spring(900,25,0)"
	
	layers.Guide1Go.on Events.Click, ->	
		startGuide1Intro()
		layers.Guide1Open.bringToFront()

	
		
	# 	Close interaction
	layers.GuideHeader2Cross.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	layers.GuideHeader2Cross.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	layers.GuideHeader1Cross.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	layers.GuideHeader2Cross.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	
	layers.GuideHeader2Cross.on Events.Click, ->
		exitGuideIndex()
		layers.setup.visible = false
	layers.GuideHeader1Cross.on Events.Click, ->
		exitGuideIndex()
		layers.setup.visible = false


# Guide index exit			
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––	

exitGuideIndex = ->
	layers.Guide.animate
		properties:
			scale: 1.1
			opacity: 0
		curve: "ease-in"
		time: 0.3			
	utils.delay 0.3, ->
		startDash()



			
# Guide1 Intro
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

startGuide1Intro = ->	
	layers.Guide1Open.visible = true
	layers.SuccessTick.visible = false
	layers.Guide1Open.bringToFront()
	layers.Guide1Open.height = screenHeight
	layers.Guide1Open.width = screenWidth
	layers.GuideBG1.width = screenWidth
	layers.GuideBG1.height = screenHeight
	
	
	layers.SetupProgress2.width = screenWidth
	layers.SetupProgress2.y = screenHeight - 70
	layers.ProgressBG2.width = screenWidth
	layers.ProgressBG2.opacity = 0
	layers.Progress2.centerX()
	layers.Progress3.centerX()
	layers.Progress3.opacity = 0
	layers.Progress2.pixelAlign()
	layers.Progress3.pixelAlign()


	
	layers.Guide1Header.centerX()
	layers.Guide1Tour.center()
	layers.Guide1Tour.pixelAlign()
	
	layers.Guide1Tip2.opacity = 0
	layers.Guide1Tip3.opacity = 0
	layers.Guide1Tip1.opacity = 0
	layers.Guide1Content.scale = 0.8
	layers.Guide1TipOpen.opacity = 0

		
	
	layers.Guide1Content.animate
		properties:
			scale:1
		curve:"spring(200,15,0)"
		
	layers.Guide.animate
		properties:
			opacity: 0
		time:0.3


	utils.delay 0.4, ->
		startGuide1()




			
			
# Guide1 Start
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

	
startGuide1 = ->	
	layers.Form.visible = false
	layers.Guide.visible = false
	layers.Guide1Open.visible = true
	layers.Guide1Content.opacity = 1
	
	layers.Guide1Open.height = screenHeight
	layers.Guide1Open.width = screenWidth
	layers.GuideBG1.width = screenWidth
	layers.GuideBG1.height = screenHeight
	
	layers.Guide1Header.centerX()
	layers.Guide1Tour.center()
	layers.Guide1Tour.pixelAlign()
	
	layers.Guide1Tip2.opacity = 0
	layers.Guide1Tip3.opacity = 0
	
	

	# 	Close interaction
	layers.Guide1Header.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	layers.Guide1Header.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	
	layers.Guide1Header.on Events.Click, ->
		startGuidesIndex()


	# Animate in the tip
	Guide1TipOpenOriginY = layers.Guide1TipOpen.y
	layers.Guide1TipOpen.y = Guide1TipOpenOriginY - 10
	layers.Guide1TipOpen.animate
		properties:
			opacity: 1
			y: Guide1TipOpenOriginY
		curve:"spring(150,12,0)"
		delay: 0.5
		
	layers.Guide1Tip1OpenGo.on Events.Click, ->
		layers.Guide1TipOpen.animate
			properties:
				opacity: 0
			time:0.2
		tourStart()

	
tourStart = ->	
	# Animate in the tip
	layers.Guide1Tip1.opacity = 0
	Guide1Tip1OriginY = layers.Guide1Tip1.y
	layers.Guide1Tip1.y = Guide1Tip1OriginY - 10
	layers.Guide1Tip1.animate
		properties:
			opacity: 1
			y: Guide1Tip1OriginY
		curve:"spring(150,12,0)"
		delay: 0.5
		
	layers.Guide1Tip1Go.on Events.Click, ->
		layers.Guide1Tip1.animate
			properties:
				opacity: 0
			time:0.2
		tourMid()
		

tourMid = ->
	# Animate in the tip
	layers.Guide1Tip2.opacity = 0
	Guide1Tip2OriginY = layers.Guide1Tip2.y
	layers.Guide1Tip2.y = Guide1Tip2OriginY - 10
	layers.Guide1Tip2.animate
		properties:
			opacity: 1
			y: Guide1Tip2OriginY
		curve:"spring(150,12,0)"
		delay: 0.5
			
	layers.Guide1Tip2Go.on Events.Click, ->
		layers.Guide1Tip2.animate
			properties:
				opacity: 0
			time:0.2
		tourFinal()


tourFinal = ->	
	# Animate in the tip
	layers.Guide1Tip3.opacity = 0
	Guide1Tip3OriginY = layers.Guide1Tip3.y
	layers.Guide1Tip3.y = Guide1Tip3OriginY - 10
	layers.Guide1Tip3.animate
		properties:
			opacity: 1
			y: Guide1Tip3OriginY
		curve:"spring(150,12,0)"
		delay: 0.5
		
	layers.Guide1Tip3Go.on Events.Click, ->
		tourExit()







# Tour Exit
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

tourExit = ->
	layers.Progress3.opacity = 1
	layers.Guide1Content.animate
		properties:
			opacity: 0
		curve:"ease"
		time: 0.2
	
	utils.delay 0.2, ->
		tourFinish()







# Tour Finish Tick yay
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

tourFinish = ->
	layers.SuccessTick.visible = true
	layers.Form.visible = false
	layers.Sparks1.visible = false
	layers.Sparks2.visible = false
	
	layers.SuccessTick.center()
	
	tutorial = 1	
	


	spark1 = new Layer
		width: 40
		height: 10
		rotation: 150
		borderRadius: 20
		backgroundColor: "white"
		opacity: 0
		superLayer: layers.TickBG
	spark1.center()
	
	spark1.animate
		properties:
			x: -150
			y: 190
			width: 40
			opacity:1
		curve:"ease"
		time: 0.5
	
	spark1.animate
		properties:
			scale:0
		curve:"ease"
		time: 1

	spark2 = new Layer
		width: 40
		height: 10
		rotation: 60
		borderRadius: 20
		backgroundColor: "white"
		opacity: 0
		superLayer: layers.TickBG
	spark2.center()
	
	spark2.animate
		properties:
			x: -80
			y: -70
			width: 60
			opacity:1
		curve:"ease"
		time: 0.5
		delay:0.14
	
	spark2.animate
		properties:
			scale:0
		curve:"ease"
		time: 1

	spark3 = new Layer
		width: 40
		height: 10
		rotation: 60
		borderRadius: 20
		backgroundColor: "white"
		opacity:0
		superLayer: layers.TickBG
	spark3.center()
	
	spark3.animate
		properties:
			x: 190
			y: 220
			width: 60
			opacity:1
		curve:"ease"
		time: 0.6
		delay:0.16
	
	spark3.animate
		properties:
			scale:0
		curve:"ease"
		time: 1

	spark4 = new Layer
		width: 40
		height: 10
		rotation: -20
		borderRadius: 20
		backgroundColor: "white"
		opacity:0
		superLayer: layers.TickBG
	spark4.centerX()
	spark4.centerY(-50)
	
	spark4.animate
		properties:
			x: 250
			y: 15
			width: 60
			opacity:1
		curve:"ease"
		time: 0.5
	
	spark4.animate
		properties:
			scale:0
		curve:"ease"
		time: 1			
	
	layers.TickBG.scale = 0
	layers.TickBG.animate
		properties:
			scale:1
		curve:"spring(150,12,0)"
	

	layers.Checkmark1.scale = 0
	layers.Checkmark1.animate
		properties:
			scale: 1
		curve:"spring(450,12,0)"
		delay:0.2


	radial = new Layer	
		borderRadius: 20
		width: 120
		height: 120
		borderRadius: 100
		superLayer: layers.TickBG
		backgroundColor: "white"
	radial.centerY()
	radial.centerX()
	radial.scale = 0
	radial.sendToBack()

	
	radialFill = new Layer	
		borderRadius: 20
		width: 100
		height: 100
		borderRadius: 300
		superLayer: radial
		backgroundColor: "#2CBCE2"
	radialFill.center()

	
	radial.animate
		properties:
			scale:2
		curve:"spring(100,0,10)"
		
	radialFill.animate
		properties:
			scale:1.2
		curve:"spring(150,42,10)"
		
	radial.animate
		properties:
			opacity:0
		time: 0.3

	layers.TickText.opacity = 0
	layers.TickText.animate
		properties:
			opacity: 1
		curve:"ease"
		time: 1
		delay: 0.4
	
	layers.SuccessButtons.opacity = 0
	layers.SuccessButtons.animate
		properties:
			opacity: 1
		curve:"ease"
		delay: 0.5
		
	
	# 	Close interaction
	layers.SuccessGo.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	layers.SuccessGo.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	layers.SuccessGo.on Events.Click, ->
		utils.delay 0.3, ->
			setupDone()
		
		




setupDone = ->
	layers.Guide.visible = false
	layers.setup.visible = false
	
	# fade in the content
	layers.Guide1Open.animate
		properties:
			opacity:0
		curve:"ease"
		time: 0.4
	
	
	layers.Dash.opacity = 0
	layers.Dash.visible = true
	
# 	fade in the content
	layers.Dash.animate
		properties:
			opacity: 1
		curve:"ease"
		time: 0.5

	utils.delay 0.5, ->
		startDash()



# Start the dash! vrroooooommm!
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
layers.Dash.width = screenWidth
layers.DashBG.height = screenHeight
layers.DashBG.width = screenWidth
layers.DashBG.centerX()
layers.DashHeader.centerX()
layers.DashHeader.pixelAlign()
layers.Widgets.centerX()
layers.Widgets.pixelAlign()

startDash = ->
	layers.Guide.visible = false
	layers.Guide1Open.visible = false
	layers.SuccessTick.visible = false
	layers.setup.visible = false
	layers.Dash.visible = true
	layers.Purchases.visible = false
	layers.BankRec.visible = false

	
	layers.Dash.width = screenWidth
	layers.DashBG.height = screenHeight
	layers.DashHeader.centerX()
	layers.DashHeader.pixelAlign()
	layers.Widgets.centerX()
	layers.Widgets.pixelAlign()
	
	layers.SWidgetTip1.opacity = 0
	layers.SWidgetTip2.opacity = 0
	layers.SWidgetTip3.opacity = 0
	layers.SWidgetTip4.opacity = 0
	layers.SWidgetTip5.opacity = 0
	
	# Go button Interactions
	layers.SWidgetGo.on Events.MouseOver, ->
		layers.SWidgetGo.animate
			properties:
				scale: 1.1
			curve:"spring(600,25,0)"
	
	layers.SWidgetGo.on Events.MouseOut, ->
		layers.SWidgetGo.animate
			properties:
				scale: 1
			curve:"spring(900,25,0)"
	
	layers.SWidgetGo.on Events.Click, ->	
		startGuidesIndex()
			
	# progress bar interactions
	layers.SWidgetTip1.y = 70
	layers.SWidgetProgress1.on Events.MouseOver, ->
		layers.SWidgetTip1.animate
			properties:
				y: 66
				opacity: 1
			curve:"spring(400,25,0)"	
	
	layers.SWidgetProgress1.on Events.MouseOut, ->
		layers.SWidgetTip1.animate
			properties:
				opacity: 0
				y: 70
			curve:"ease"
			time: 0.2



	# progress bar interactions
	layers.SWidgetTip2.y = 70
	layers.SWidgetProgress2.on Events.MouseOver, ->
		layers.SWidgetTip2.animate
			properties:
				y: 66
				opacity: 1
			curve:"spring(400,25,0)"	
	
	layers.SWidgetProgress2.on Events.MouseOut, ->
		layers.SWidgetTip2.animate
			properties:
				opacity: 0
				y: 70
			curve:"ease"
			time: 0.2



	# progress bar interactions
	layers.SWidgetTip3.y = 70
	layers.SWidgetProgress3.on Events.MouseOver, ->
		layers.SWidgetTip3.animate
			properties:
				y: 66
				opacity: 1
			curve:"spring(400,25,0)"	
	
	layers.SWidgetProgress3.on Events.MouseOut, ->
		layers.SWidgetTip3.animate
			properties:
				opacity: 0
				y: 70
			curve:"ease"
			time: 0.2
	
	
	
	# progress bar interactions
	layers.SWidgetTip4.y = 70
	layers.SWidgetProgress4.on Events.MouseOver, ->
		layers.SWidgetTip4.animate
			properties:
				y: 66
				opacity: 1
			curve:"spring(400,25,0)"	
	
	layers.SWidgetProgress4.on Events.MouseOut, ->
		layers.SWidgetTip4.animate
			properties:
				opacity: 0
				y: 70
			curve:"ease"
			time: 0.2

	
	
	# progress bar interactions
	layers.SWidgetTip5.y = 70
	layers.SWidgetProgress5.on Events.MouseOver, ->
		layers.SWidgetTip5.animate
			properties:
				y: 66
				opacity: 1
			curve:"spring(400,25,0)"	
	
	layers.SWidgetProgress5.on Events.MouseOut, ->
		layers.SWidgetTip5.animate
			properties:
				opacity: 0
				y: 70
			curve:"ease"
			time: 0.2


	# Navlink box
	NavLinkAccount = new Layer
		width: 100
		height: 30
		backgroundColor: "transparent"
		superLayer: layers.DashHeader
		x: 460
		y: 106
	# 	Nav interaction
	NavLinkAccount.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	NavLinkAccount.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	NavLinkAccount.on Events.Click, ->
		startPurchases()
		
		
	
	ReconcileBtn = new Layer
		width: 129
		height: 30
		backgroundColor: "transparent"
		superLayer: layers.DemoWidgets
		x: 15
		y: 230
	
	# 	Nav interaction
	ReconcileBtn.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
		ReconcileBtn.backgroundColor = "white"
		ReconcileBtn.opacity = 0.2
		
	ReconcileBtn.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
		ReconcileBtn.backgroundColor = "transparent"
		ReconcileBtn.opacity = 0
	ReconcileBtn.on Events.Click, ->
		startBankRec()





# Start purchasesssssssssssesesesess billllls homie its ma billllss oh lawwwwdie
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

layers.Purchases.width = screenWidth
layers.PurchasesBG.height = screenHeight
layers.PurchasesBG.width = screenWidth
layers.PurchasesBG.centerX()
layers.PurchasesHeader.centerX()
layers.PurchasesHeader.pixelAlign()
layers.PurchasesContent.centerX()
layers.PurchasesContent.pixelAlign()


startPurchases = ->
	layers.Guide.visible = false
	layers.Guide1Open.visible = false
	layers.SuccessTick.visible = false
	layers.setup.visible = false
	layers.Dash.visible = false
	layers.Purchases.visible = true
	
	NavLinkDash = new Layer
		width: 100
		height: 30
		backgroundColor: "transparent"
		superLayer: layers.PurchasesHeader
		x: 360
		y: 106
	
	
# 	Nav interaction
	NavLinkDash.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	NavLinkDash.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	NavLinkDash.on Events.Click, ->
		startDash()
		
	
	
		







# Start bankrec yo self foool
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

layers.BankRec.width = screenWidth
layers.BankRecBG.height = screenHeight
layers.BankRecBG.width = screenWidth
layers.BankRecBG.centerX()
layers.BankRecHeader.centerX()
layers.BankRecHeader.pixelAlign()
layers.BankRecContent.centerX()
layers.BankRecContent.pixelAlign()


startBankRec = ->
	layers.Guide.visible = false
	layers.Guide1Open.visible = false
	layers.SuccessTick.visible = false
	layers.setup.visible = false
	layers.Dash.visible = false
	layers.Purchases.visible = false
	layers.BankRec.visible = true
	layers.Guide3Open.visible = false
	
	NavLinkDash = new Layer
		width: 100
		height: 30
		backgroundColor: "transparent"
		superLayer: layers.BankRecHeader
		x: 360
		y: 106
	
	# 	Back to dash interaction
	NavLinkDash.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	NavLinkDash.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	NavLinkDash.on Events.Click, ->
		startDash()
	
	# Launch the tourz!!!!!!!!!!!!!!!!!!!!!
	layers.BankRecTourGo.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	layers.BankRecTourGo.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	layers.BankRecTourGo.on Events.Click, ->
		startGuide3Intro()


	
	
		

			
# Guide3 Intro
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

startGuide3Intro = ->	
	layers.Guide1Open.visible = false
	layers.Guide3Open.visible = true
	layers.SuccessTick.visible = false
	layers.Guide3Open.bringToFront()
	layers.Guide3Open.height = screenHeight
	layers.Guide3Open.width = screenWidth
	layers.GuideBG3.width = screenWidth
	layers.GuideBG3.height = screenHeight
	


	
	layers.Guide3Header.centerX()
	layers.Guide3Tour.center()
	layers.Guide3Tour.pixelAlign()
	
	layers.Guide3Tip4.opacity = 0
	layers.Guide3Tip2.opacity = 0
	layers.Guide3Tip3.opacity = 0
	layers.Guide3Tip1.opacity = 0
	layers.Guide3Content.scale = 0.8
	layers.Guide3TipOpen.opacity = 0
	layers.Guide3Tip1Overlay.opacity = 0
	layers.Guide3Tip2Overlay.opacity = 0
	layers.Guide3Tip3Overlay.opacity = 0
	layers.Guide3Tip4Overlay.opacity = 0
	layers.Guide3Screen2.opacity = 0


		
	
	layers.Guide3Content.animate
		properties:
			scale:1
		curve:"spring(200,15,0)"
		
	layers.Guide.animate
		properties:
			opacity: 0
		time:0.3


	utils.delay 0.4, ->
		startGuide3()




			
			
# Guide3 Start
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

	
startGuide3 = ->	
	layers.Form.visible = false
	layers.Guide.visible = false
	layers.Guide1Open.visible = true
	layers.Guide1Content.opacity = 1
	
	layers.Guide3Open.height = screenHeight
	layers.Guide3Open.width = screenWidth
	layers.GuideBG1.width = screenWidth
	layers.GuideBG1.height = screenHeight
	
	layers.Guide3Header.centerX()
	layers.Guide3Tour.center()
	layers.Guide3Tour.pixelAlign()
	
	layers.Guide3Tip2.opacity = 0
	layers.Guide3Tip3.opacity = 0
	layers.Guide3Tip4.opacity = 0
	
	

	# 	Close interaction
	layers.Guide3Header.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	layers.Guide3Header.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	
	layers.Guide1Header.on Events.Click, ->
		startGuidesIndex()


	# Animate in the tip
	Guide3TipOpenOriginY = layers.Guide3TipOpen.y
	layers.Guide3TipOpen.y = Guide3TipOpenOriginY - 10
	layers.Guide3TipOpen.animate
		properties:
			opacity: 1
			y: Guide3TipOpenOriginY
		curve:"spring(150,12,0)"
		delay: 0.5
		
	layers.Guide3TipOpenGo.on Events.Click, ->
		layers.Guide3TipOpen.animate
			properties:
				opacity: 0
			time:0.2
		tour3Start()

# 	
tour3Start = ->	
	# Animate in the tip
	layers.Guide3Tip1.opacity = 0
	Guide3Tip1OriginY = layers.Guide3Tip1.y
	layers.Guide3Tip1.y = Guide3Tip1OriginY - 10
	layers.Guide3Tip1.animate
		properties:
			opacity: 1
			y: Guide3Tip1OriginY
		curve:"spring(150,12,0)"
		delay: 0.5
	layers.Guide3Tip1Overlay.animate
		properties:
			opacity: 1
		curve:"ease"
		delay: 0.5
		
	layers.Guide3Tip1Go.on Events.Click, ->
		layers.Guide3Tip1.animate
			properties:
				opacity: 0
			time:0.2
		layers.Guide3Tip1Overlay.animate
			properties:
				opacity: 0
			time: 1.2
		tour2()
		

tour2 = ->
	# Animate in the tip
	layers.Guide3Tip2.opacity = 0
	Guide3Tip2OriginY = layers.Guide3Tip2.y
	layers.Guide3Tip2.y = Guide3Tip2OriginY - 10
	layers.Guide3Tip2.animate
		properties:
			opacity: 1
			y: Guide3Tip2OriginY
		curve:"spring(150,12,0)"
		delay: 0.5
	layers.Guide3Tip2Overlay.animate
		properties:
			opacity: 1
		curve:"ease"
		delay: 0.5
	layers.Guide3Tip2Go.on Events.Click, ->
		layers.Guide3Tip2.animate
			properties:
				opacity: 0
			time:0.2
		layers.Guide3Tip2Overlay.animate
			properties:
				opacity: 0
			time: 1.2			
		tour3()


tour3 = ->	
	# Animate in the tip
	layers.Guide3Tip3.opacity = 0
	Guide3Tip3OriginY = layers.Guide3Tip3.y
	layers.Guide3Tip3.y = Guide3Tip3OriginY - 10
	layers.Guide3Tip3.animate
		properties:
			opacity: 1
			y: Guide3Tip3OriginY
		curve:"spring(150,12,0)"
		delay: 0.5
	layers.Guide3Tip3Overlay.animate
		properties:
			opacity: 1
		curve:"ease"
		delay: 0.5	
	layers.Guide3Tip3Go.on Events.Click, ->
		layers.Guide3Tip3.animate
			properties:
				opacity: 0
			time:0.2
		layers.Guide3Tip3Overlay.animate
			properties:
				opacity: 0
			time: 1.2
		tour4()

tour4 = ->	
	# Animate in the tip
	layers.Guide3Tip4.opacity = 0
	Guide3Tip4OriginY = layers.Guide3Tip4.y
	layers.Guide3Tip4.y = Guide3Tip4OriginY - 10
	layers.Guide3Tip4.animate
		properties:
			opacity: 1
			y: Guide3Tip4OriginY
		curve:"spring(150,12,0)"
		delay: 0.5
	layers.Guide3Tip4Overlay.animate
		properties:
			opacity: 1
		curve:"ease"
		delay: 0.5
		
	layers.Guide3Tip4Go.on Events.Click, ->
		layers.Guide3Tip4.animate
			properties:
				opacity: 0
			time:0.2
		layers.Guide3Tip1Overlay.animate
			properties:
				opacity: 0
			time: 1.2
		tourExit3()

tour5 = ->	
	# Animate in the tip
	layers.Guide3Tip5.opacity = 0
	Guide3Tip5OriginY = layers.Guide3Tip5.y
	layers.Guide3Tip5.y = Guide3Tip5OriginY - 10
	layers.Guide3Tip5.animate
		properties:
			opacity: 1
			y: Guide3Tip5OriginY
		curve:"spring(150,12,0)"
		delay: 0.5
		
	layers.Guide3Tip5Go.on Events.Click, ->
		layers.Guide3Tip5.animate
			properties:
				opacity: 0
			time:0.2
		tourExit3()

# Tour Exit
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

tourExit3 = ->
	layers.SuccessTick3.visible = false
	
	layers.Guide3Content.animate
		properties:
			opacity: 0
		curve:"ease"
		time: 0.2
	
	utils.delay 0.2, ->
		tourFinish3()







# Tour Finish Tick yay
# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

tourFinish3 = ->
	layers.Form.visible = false
	layers.Guide.visible = false
	layers.Guide1Open.visible = false
	layers.SuccessTick.visible = false
	layers.setup.visible = false
	layers.Dash.visible = false
	layers.Purchases.visible = false
	layers.BankRec.visible = false
	layers.Guide3Open.visible = true
	layers.SuccessTick3.visible = true


	
	layers.SuccessTick3.center()
	
	


	spark1 = new Layer
		width: 40
		height: 10
		rotation: 150
		borderRadius: 20
		backgroundColor: "white"
		opacity: 0
		superLayer: layers.TickBG3
	spark1.center()
	
	spark1.animate
		properties:
			x: -150
			y: 190
			width: 40
			opacity:1
		curve:"ease"
		time: 0.5
	
	spark1.animate
		properties:
			scale:0
		curve:"ease"
		time: 1

	spark2 = new Layer
		width: 40
		height: 10
		rotation: 60
		borderRadius: 20
		backgroundColor: "white"
		opacity: 0
		superLayer: layers.TickBG3
	spark2.center()
	
	spark2.animate
		properties:
			x: -80
			y: -70
			width: 60
			opacity:1
		curve:"ease"
		time: 0.5
		delay:0.14
	
	spark2.animate
		properties:
			scale:0
		curve:"ease"
		time: 1

	spark3 = new Layer
		width: 40
		height: 10
		rotation: 60
		borderRadius: 20
		backgroundColor: "white"
		opacity:0
		superLayer: layers.TickBG3
	spark3.center()
	
	spark3.animate
		properties:
			x: 190
			y: 220
			width: 60
			opacity:1
		curve:"ease"
		time: 0.6
		delay:0.16
	
	spark3.animate
		properties:
			scale:0
		curve:"ease"
		time: 1

	spark4 = new Layer
		width: 40
		height: 10
		rotation: -20
		borderRadius: 20
		backgroundColor: "white"
		opacity:0
		superLayer: layers.TickBG3
	spark4.centerX()
	spark4.centerY(-50)
	
	spark4.animate
		properties:
			x: 250
			y: 15
			width: 60
			opacity:1
		curve:"ease"
		time: 0.5
	
	spark4.animate
		properties:
			scale:0
		curve:"ease"
		time: 1			
	
	layers.TickBG3.scale = 0
	layers.TickBG3.animate
		properties:
			scale:1
		curve:"spring(150,12,0)"
	

	layers.Checkmark13.scale = 0
	layers.Checkmark13.animate
		properties:
			scale: 1
		curve:"spring(450,12,0)"
		delay:0.2


	radial = new Layer	
		borderRadius: 20
		width: 120
		height: 120
		borderRadius: 100
		superLayer: layers.TickBG3
		backgroundColor: "white"
	radial.centerY()
	radial.centerX()
	radial.scale = 0
	radial.sendToBack()

	
	radialFill = new Layer	
		borderRadius: 20
		width: 100
		height: 100
		borderRadius: 300
		superLayer: radial
		backgroundColor: "#2CBCE2"
	radialFill.center()

	
	radial.animate
		properties:
			scale:2
		curve:"spring(100,0,10)"
		
	radialFill.animate
		properties:
			scale:1.2
		curve:"spring(150,42,10)"
		
	radial.animate
		properties:
			opacity:0
		time: 0.3

	layers.TickText3.opacity = 0
	layers.TickText3.animate
		properties:
			opacity: 1
		curve:"ease"
		time: 1
		delay: 0.4
	
	layers.SuccessButtons3.opacity = 0
	layers.SuccessButtons3.animate
		properties:
			opacity: 1
		curve:"ease"
		delay: 0.5
		
	
	# 	Close interaction
	layers.SuccessGo3.on Events.MouseOver, ->
		document.body.style.cursor = "pointer"
	layers.SuccessGo3.on Events.MouseOut, ->
		document.body.style.cursor = "auto"
	layers.SuccessGo3.on Events.Click, ->
		utils.delay 0.3, ->
			startBankRec()
		






# Initialize start screen
startBankRec()
	






