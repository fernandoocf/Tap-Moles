local composer = require( "composer" )
local scene = composer.newScene()
local troca = {}
local background
local fnLoad1 = {}
local fnLoad2 = {}
local um
local dois
local tres
local sceneGroup


function scene:create(e) 

    sceneGroup = self.view

	background = display.newImageRect( "img/background.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
    sceneGroup:insert(background)


	

	
	tres = display.newText("3",display.contentWidth/2,display.contentHeight/2,"t1",120)
	transition.fadeOut(tres, { time= 1000, onComplete = fnLoad2})
    sceneGroup:insert(tres)

end

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

function troca()
		composer.removeScene("chamadaJogo2")
		composer.gotoScene("stage2")
	return true
end

function fnLoad1() 
	um = display.newText("1",display.contentWidth/2,display.contentHeight/2,"t1",120)
	transition.fadeOut(um, { time= 1000, onComplete= troca})
    sceneGroup:insert(um)
end

function fnLoad2() 
	dois = display.newText("2",display.contentWidth/2,display.contentHeight/2,"t1",120)
	transition.fadeOut(dois, { time= 1000, onComplete = fnLoad1})
    sceneGroup:insert(dois)
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene