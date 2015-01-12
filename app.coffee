document.body.style.cursor = "auto"
Framer.Device.contentScale = 1



background = new BackgroundLayer
	backgroundColor:"RGBA(246, 248, 249, 1)"




# This imports all the layers for "Todo" into todoLayers1
toDo = Framer.Importer.load "imported/Todo"



toDo.container.style["border"] = "1px solid RGBA(212, 212, 212, .5)"
toDo.container.borderRadius = 4
toDo.container.width = 462

toDo.App.centerX()




toDo.Arrow.opacity = 0
toDo.TickDone.opacity = 0
toDo.TickDone.x = 0
toDo.TickDefault.opacity = 0

toDo.Arrow2.opacity = 0
toDo.TickDone2.opacity = 0
toDo.TickDefault2.x = 0
toDo.TickDefault2.opacity = 0

toDo.TickDone3.opacity = 0
toDo.Arrow3.opacity = 0
toDo.TickDefault3.x = 0
toDo.TickDefault3.opacity = 0

toDo.TickDone4.opacity = 0
toDo.Arrow4.opacity = 0
toDo.TickDefault4.x = 0
toDo.TickDefault4.opacity = 0

toDo.TickDone5.opacity = 0
toDo.Arrow5.opacity = 0
toDo.TickDefault5.x = 0
toDo.TickDefault5.opacity = 0

toDo.Cross.opacity = 0.4

toDo.Header2.opacity = 0
toDo.Go.opacity = 1
toDo.Go.visible = false
toDo.Footer2.opacity = 0


toDo.Go.z = 1300
toDo.Go.x = toDo.container.x + 385
toDo.Go.y = toDo.container.y + 60
toDo.Radial.visible = false
toDo.RFill.scale = 0

BankY = toDo.Bank.y
CashY = toDo.Cashflow.y



# -----------------------------------------------------------------------------
# COLLAPSED

# Highlight on mouse over
toDo.Go.on Events.MouseOver, ->
	toDo.Go.animate
		properties:
			scale: 1.1
		curve: "spring(500,20,0)"
		
toDo.Go.on Events.MouseOut, ->
	goYOrigin = toDo.Go.y
	toDo.Go.animate
		properties:
			scale: 1
		time: 0.1

# Animation on click
toDo.Go.on Events.Click, ->
	toDo.Go.originX = -1.75
	toDo.Go.originY = 2
	
	toDo.Go.animate
		properties:
			rotation: -90
		curve: "ease"
		time: 0.2
	
	toDo.icon.animate
		properties:
			opacity: 0
		time: 0.1
		
	toDo.Header1.visible = false
		
	toDo.Go.on Events.AnimationEnd, -> 	
		
		toDo.Header2.opacity = 0
		toDo.Radial.visible = true

		
		toDo.Go.destroy()
		
		toDo.RFill.animate
			properties:
				scale: 1
			time: 0.1
			
			toDo.RFill.on Events.AnimationEnd, -> 
				toDo.Radial.destroy()
				toDo.Header1.visible = true
				
				
		toDo.Header1.opacity = 1			
		
		toDo.Go.visible = true
		
		toDo.Rows.animate
			properties:
				opacity: 1
				scaleY: 1
				y: 82
			curve: "spring(800,60,10)"
			time: 0.2
	
	toDo.Footer.animate
		properties:
			y: 421
		curve: "spring(800,60,10)"
		
	toDo.Progress.animate
		properties:
			x:20
		curve: "spring(500,60,0)"
	
	toDo.Time.animate
		properties:
			opacity: 1
			x: 389
		curve: "spring(500,60,0)"
	
	toDo.container.animate
		properties:
			height: 490
		curve: "spring(800,60,10)"
		
	toDo.Bank.animate
		properties:
			y:BankY
		curve: "spring(900,60,10)"
		
	toDo.Cashflow.animate
		properties:
			y:CashY
		curve: "spring(900,60,10)"


		




			


	
		
			









# -----------------------------------------------------------------------------
# EXPANDED

# Highlight on mouse over
toDo.Cross.on Events.MouseOver, ->
	toDo.Cross.animate
		properties:
			opacity: 1
		curve: "ease"
		time: 0.4
	document.body.style.cursor = "pointer"
# Reduce on mouse out
toDo.Cross.on Events.MouseOut, ->
	toDo.Cross.animate
		properties:
			opacity: 0.4
		curve: "ease-in"
		time: 0.2
	document.body.style.cursor = "auto"

# Collapse on click
toDo.Cross.on Events.Click, ->
	toDo.Go.visible = true
	toDo.Rows.animate
		properties:
			opacity: 0
			scaleY: 0.9
			y: 30
		curve: "ease-in"
		time: 0.2
	
	toDo.Footer.animate
		properties:
			y: 81
			z: 100
		curve: "spring(800,60,10)"
		
	toDo.Progress.animate
		properties:
			x:50
		curve: "spring(500,60,0)"
	
	toDo.Time.animate
		properties:
			opacity: 0
			x: 900
		curve: "spring(500,60,0)"
	
	toDo.container.animate
		properties:
			height: 152
			backgroundColor: "Red"
		curve: "spring(800,60,10)"
		
	toDo.Header2.animate
		properties:
			opacity: 1
		curve: "spring(900,60,10)"
	
	goYOrigin = toDo.Go.y
	toDo.Go.y = goYOrigin - 5
	goYOrigin = toDo.Go.y

	toDo.Go.animate
		properties:
			y: goYOrigin + 5
			opacity:1
			z: 201
		curve: "spring(700,60,10)"
	
	toDo.Header1.animate
		properties:
			opacity:0
		curve: "spring(900,60,10)"
		
	toDo.Bank.animate
		properties:
			y:BankY - 340
		curve: "spring(900,60,10)"
		
	toDo.Cashflow.animate
		properties:
			y:CashY - 340
		curve: "spring(900,60,10)"






# ---------------------------------------
# States Row 1


TickDone = "unchecked"
toDo.TickDone.x = 0
TickX = toDo.TickDone.x
toDo.TickDone.opacity = 0
Tickopacity = toDo.TickDone.opacity
# print TickDone
# print TickX


# Reveal arrow and tickdefault on mouse over
toDo.Row1.on Events.MouseOver, ->	
	toDo.Arrow.animate
		properties:
			x: 401 + 10
			opacity: 1
		curve: "spring(500,20,0)"
	toDo.TickDone.animate
		properties:
			x: + 17
			opacity: Tickopacity + 0.25
		curve: "spring(500,20,0)"

	document.body.style.cursor = "pointer"


# Hide arrow and tick on mouse out
toDo.Row1.on Events.MouseOut, ->	
	if TickDone == "checked"
			TickX = 17
	else
	toDo.Arrow.animate
		properties:
			x: 401
			opacity: 0
		curve: "spring(500,20,0)"
	toDo.TickDone.animate
		properties:
			x: TickX
			opacity: Tickopacity
		curve: "spring(500,20,0)"
	document.body.style.cursor = "auto"
# 	print TickDone + "!!"
# 	print TickX

		


# Show and scale TickDone on click		
toDo.TickDone.on Events.Click, ->	
	TickDone = "checked"
	toDo.TickDone.animate
		properties:
			opacity: 1
			scale: 1.25
		time: 0.1
	toDo.TickDone.on Events.AnimationEnd, ->	
		toDo.TickDone.animate
			properties:
				opacity: 1
				scale: 1
			time: 0.1
		Tickopacity = toDo.TickDone.opacity
# 		TickX = toDo.TickDone.x	
# 		print TickDone
	

	






# ---------------------------------------
# States Row 2


TickDone2 = "unchecked"
toDo.TickDone2.x = 0
TickX2 = toDo.TickDone2.x
toDo.TickDone3.opacity = 0
Tickopacity2 = toDo.TickDone2.opacity
# print TickDone
# print TickX


# Reveal arrow and tickdefault on mouse over
toDo.Row2.on Events.MouseOver, ->	
	toDo.Arrow2.animate
		properties:
			x: 401 + 10
			opacity: 1
		curve: "spring(500,20,0)"
	toDo.TickDone2.animate
		properties:
			x: + 17
			opacity: Tickopacity2 + 0.25
		curve: "spring(500,20,0)"

	document.body.style.cursor = "pointer"


# Hide arrow and tick on mouse out
toDo.Row2.on Events.MouseOut, ->	
	if TickDone2 == "checked"
			TickX2 = 17
	else
	toDo.Arrow2.animate
		properties:
			x: 401
			opacity: 0
		curve: "spring(500,20,0)"
	toDo.TickDone2.animate
		properties:
			x: TickX2
			opacity: Tickopacity2
		curve: "spring(500,20,0)"
	document.body.style.cursor = "auto"
# 	print TickDone + "!!"
# 	print TickX

		


# Show and scale TickDone on click		
toDo.TickDone2.on Events.Click, ->	
	TickDone2 = "checked"
	toDo.TickDone2.animate
		properties:
			opacity: 1
			scale: 1.25
		time: 0.1
	toDo.TickDone2.on Events.AnimationEnd, ->	
		toDo.TickDone2.animate
			properties:
				opacity: 1
				scale: 1
			time: 0.1
		Tickopacity2 = toDo.TickDone2.opacity
# 		TickX = toDo.TickDone.x	
# 		print TickDone



# ---------------------------------------
# States Row 3


TickDone3 = "unchecked"
toDo.TickDone3.x = 0
TickX3 = toDo.TickDone3.x
toDo.TickDone3.opacity = 0
Tickopacity3 = toDo.TickDone3.opacity
# print TickDone
# print TickX


# Reveal arrow and tickdefault on mouse over
toDo.Row3.on Events.MouseOver, ->	
	toDo.Arrow3.animate
		properties:
			x: 401 + 10
			opacity: 1
		curve: "spring(500,20,0)"
	toDo.TickDone3.animate
		properties:
			x: + 17
			opacity: Tickopacity3 + 0.25
		curve: "spring(500,20,0)"

	document.body.style.cursor = "pointer"


# Hide arrow and tick on mouse out
toDo.Row3.on Events.MouseOut, ->	
	if TickDone3 == "checked"
			TickX3 = 17
	else
	toDo.Arrow3.animate
		properties:
			x: 401
			opacity: 0
		curve: "spring(500,20,0)"
	toDo.TickDone3.animate
		properties:
			x: TickX3
			opacity: Tickopacity3
		curve: "spring(500,20,0)"
	document.body.style.cursor = "auto"
# 	print TickDone + "!!"
# 	print TickX

		


# Show and scale TickDone on click		
toDo.TickDone3.on Events.Click, ->	
	TickDone3 = "checked"
	toDo.TickDone3.animate
		properties:
			opacity: 1
			scale: 1.25
		time: 0.1
	toDo.TickDone3.on Events.AnimationEnd, ->	
		toDo.TickDone3.animate
			properties:
				opacity: 1
				scale: 1
			time: 0.1
		Tickopacity3 = toDo.TickDone3.opacity
# 		TickX = toDo.TickDone.x	
# 		print TickDone
		




