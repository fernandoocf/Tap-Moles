local composer = require( "composer" )
local scene = composer.newScene()
local w,h = display.contentWidth, display.contentHeight
local background_menu
local titulo 
local jogar 
local opcoes
local jogar = {}
local som = {}
local creditos
local Creditos = {}
local musica
function scene:create( event )

    local sceneGroup = self.view

    background_menu = display.newImage("img/background_menu2.png", 280, 190)
    titulo =  display.newImage("img/tap.png", 250, 0)
    	transition.to(titulo, { time= 900 , x=250 ,y=70})
    jogar = display.newImage("img/jogar.png", 345,250)
    som = display.newImage("img/som.png",150,250)
    creditos = display.newImage("img/creditosemfundo.png",245, 300)

    musica = audio.loadStream("media/menu.mid")
    sceneGroup:insert(background_menu)
    sceneGroup:insert(titulo)
    sceneGroup:insert(jogar)
    sceneGroup:insert(som)
    sceneGroup:insert(creditos)
    

end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        jogar:addEventListener('touch', Jogar)
        som:addEventListener('touch', somOn)
        creditos:addEventListener('touch',Creditos)
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

function Jogar(e)
    if e.phase == "ended" then
        composer.removeScene("menu")
        composer.gotoScene("dificuldade")
    end
    return true
end

function somOn(e)
    if e.phase == "ended" then
        
    end
    return true
end

function Creditos(e)
    if e.phase == "ended" then
        composer.removeScene("menu")
        composer.gotoScene("creditos")
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