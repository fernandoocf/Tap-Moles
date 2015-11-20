local composer = require( "composer" )
local scene = composer.newScene()
local background_menu
local facil = {}
local dificil = {}
local placa
local nivel
local easy
local hard
local voltar = {}

function scene:create( event )

    local sceneGroup = self.view

    background_menu = display.newImage("img/background_menu2.png", 280, 190)
    sceneGroup:insert(background_menu)
    
    placa = display.newImage ("img/placa.png", display.contentWidth/2, display.contentHeight/2)
    sceneGroup:insert(placa)
    
    dificil = display.newImage("img/capacete.png", 320,180)
    sceneGroup:insert(dificil)
    nivel = display.newText("Level", display.contentWidth/2, 100, "t1", 50)
    sceneGroup:insert(nivel)
    facil = display.newImage("img/mole.png", 150, 180)
    sceneGroup:insert(facil)
    easy = display.newText("Easy", 150, 230, "t1", 30)
    sceneGroup:insert(easy)
    hard = display.newText("Hard", 320, 230, "t1", 30)
    sceneGroup:insert(hard)
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
         facil:addEventListener('touch', Facil)
         dificil:addEventListener('touch', Dificil)
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

function Facil(e)
    if e.phase == "ended" then
        composer.removeScene("dificuldade")
        composer.gotoScene("chamadaJogo")
    end
    return true
end

function Dificil(e)
    if e.phase == "ended" then
        composer.removeScene("dificuldade")
        composer.gotoScene("chamadaJogo2")
    end
    return true
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