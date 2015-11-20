local composer = require( "composer" )
local scene = composer.newScene()
local background_menu
local placa
local des
local fernando
local art
local caio
local voltar = {}

function scene:create( event )

    local sceneGroup = self.view

    background_menu = display.newImage("img/background_menu2.png", 280, 190)
    sceneGroup:insert(background_menu)
    
    placa = display.newImage ("img/placa.png", display.contentWidth/2, display.contentHeight/2)
    sceneGroup:insert(placa)
    
    des = display.newText("Development", display.contentWidth/2, 110, "t1", 35)
    sceneGroup:insert(des)
    
    fernando = display.newText("Fernando Oliveira", display.contentWidth/2, 150, "t1", 20)
    sceneGroup:insert(fernando)
    
    art = display.newText("Design and Arts", display.contentWidth/2, 200, "t1", 35)
    sceneGroup:insert(art)
    
    caio = display.newText("Caio Ritter", display.contentWidth/2, 240, "t1", 20)
    sceneGroup:insert(caio)

    voltar = display.newImage("img/voltar.png", 85, 82)
    sceneGroup:insert(voltar)


    

end


-- "scene:show()"
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

function Voltar(e)
    if e.phase == "ended" then
        composer.removeScene("dificuldade")
        composer.gotoScene("menu")
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