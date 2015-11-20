local composer = require( "composer" )

local scene = composer.newScene()
local background
local texto
local placa
local gameover
local score
local pontos
local retry
local Retry = {}
local Menu = {}
local menu

function scene:create( event )

    local sceneGroup = self.view

    background = display.newImageRect( "img/background.png", display.contentWidth, display.contentHeight )
    background.anchorX = 0
    background.anchorY = 0
    sceneGroup:insert(background)

    placa = display.newImage ("img/placa.png", display.contentWidth/2, display.contentHeight/2)
    sceneGroup:insert(placa)
    gameover = display.newText("GAME OVER", display.contentWidth/2, 90, "t1", 40)
    sceneGroup:insert(gameover)
    score = display.newText("Score",display.contentWidth/2, 130, "t1",12*2)
    sceneGroup:insert(score)
    pontos = display.newText(pontosIniciais, display.contentWidth/2,165, "t1", 40)
    sceneGroup:insert(pontos)
    retry = display.newText("Retry", 310, 230, "t1", 25)
    sceneGroup:insert(retry)
    menu = display.newText("Menu", 150, 230, "t1", 25)
    sceneGroup:insert(menu)

   
end

-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        menu:addEventListener('touch',Menu)
        retry:addEventListener('touch',Retry)
        -- Called when the scene is now on screen. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! composer.removeHidden()
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

function Menu(e)
    if e.phase == "ended" then
        composer.removeScene("pontos")
        composer.gotoScene("menu")
        pontosIniciais = 0
    end
   return true
end

function Retry(e)
    if e.phase == "ended" then
        composer.removeScene("pontos2")
        composer.gotoScene("chamadaJogo2")
        pontosIniciais = 0
    end
   return true
end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene