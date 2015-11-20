local composer = require( "composer" )
local scene = composer.newScene()
local w,h = display.contentWidth, display.contentHeight
local voltar = {}
local background_menu
local titulo
local voltar


function scene:create( event )

    local sceneGroup = self.view

    background_menu = display.newImage("img/background caio.png", 280, 200)
    titulo =  display.newImage("img/titulo.png", 250, 50)
    voltar = display.newImage("img/voltar.png", 250, 280)

    sceneGroup:insert(background_menu)    
    sceneGroup:insert(titulo)
    sceneGroup:insert(voltar)


end

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        voltar:addEventListener('touch',Voltar)
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end

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

function Voltar(e)
    if e.phase == "ended" then
        composer.removeScene("regras")
        composer.gotoScene("opcoes")
    end
   return true
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene