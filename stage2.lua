local composer = require( "composer" )
local scene = composer.newScene()
local background
local tempo_restante
local tempo
local contagem_regressiva
local pontos
local contagem_pontos
local errou
local punch
local derrota
local toupeira
local  buraco = {}
local toupeiratouch = {}
local posx = 60
local posy = 120
local backgroundtouch = {}
local contagem_regressiva = {} 
local opcoes
local sceneGroup
function scene:create(e)  

    sceneGroup = self.view

	display.setStatusBar( display.HiddenStatusBar )
	background = display.newImageRect( "img/background.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
    background.name = "fundo"
	background.x, background.y = 0, 0
	sceneGroup:insert(background)
	tempo_restante = 15
    tempo = display.newText( "Tempo", display.contentWidth/2,15, "t1", 25 )
    sceneGroup:insert(tempo)
    contagem_regressiva = display.newText( tempo_restante, 0, 0, "t1",12*2)
    contagem_regressiva.x = display.contentWidth/2
    contagem_regressiva.y = display.contentHeight/7.1
    tempo:setFillColor( 9, 9, 9 )
    sceneGroup:insert(contagem_regressiva)
    pontos = display.newImage("img/capacetemorto.png" ,25,20)
    sceneGroup:insert(pontos)
    tempo:setFillColor( 9, 9, 9 )
    contagem_pontos = display.newText( pontosIniciais, 65, 25, "t1",12*2)
    sceneGroup:insert(contagem_pontos)
    contagem_regressiva.x = display.contentWidth/2
    contagem_regressiva.y = display.contentHeight/7.1

    opcoes = display.newImage("img/option2.png", 460, 20)
    sceneGroup:insert(opcoes)
	--local somDoFundo = audio.loadStream("media/fun")
	errou = audio.loadSound("media/errou.wav")
	punch = audio.loadSound("media/punch.wav")
	derrota = audio.loadSound("media/fail.wav")
	
    i = math.random(0,10)
    for i=0,10 do
	     buraco[i] = display.newImage("img/buraco1.png")
	     buraco[i].x = posx
	     buraco[i].y = posy
         buraco[i].flag = false


	     posx = posx + 120


	     if i == 3 then
	     	posx = 120
	     	posy = 200
	     elseif i == 6 then
	     	posx = 60
	     	posy = 280
	     end
         sceneGroup:insert(buraco[i])
    end
	
    
    
    function contagemregressiva()


         if tempo_restante > 0 then
            tempo_restante = tempo_restante - 1
            contagem_regressiva.text = tempo_restante
        end
        

        if tempo_restante == 0 then
            audio.play(derrota)
            timer.pause(jogotmp)
            timer.pause(criatoup)
            composer.removeScene("stage2")
            composer.gotoScene("pontos2")

        end
    end

    jogotmp = timer.performWithDelay(1000, contagemregressiva,15)
 
    --criartoupeira()
    --criatoup = timer.performWithDelay(700,criartoupeira,-1)
end

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
            --toupeira:addEventListener("touch", toupeiratouch)
            criatoup = timer.performWithDelay(1000,criartoupeira,-1)
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

function toupeiratouch(e)  
        if(e.numTaps == 2) then
            audio.play(punch)
            display.remove(e.target)
            e.target = nil
            pontosIniciais = pontosIniciais + 1
            contagem_pontos.text = pontosIniciais 
        end
        --toupeira:addEventListener("touch", criartoupeira)
        --return true
end

function criartoupeira(e)
        toupeira = {}
        
        local options = { width = 64, height = 64, numFrames = 2}
        local playerSheet = graphics.newImageSheet("sprite/sprite2.png", options)
        local sequenceData = {
            name = "toupeiraRindo2", start = 1, count = 2, time = 800, loopCount = 0
        }
        i = math.random(0,10)
        if buraco[i].flag == false then
            toupeira[i] = display.newSprite(playerSheet, sequenceData)
            toupeira[i].myName = "toupeira"
            toupeira[i].x = buraco[i].x
            toupeira[i].y = buraco[i].y -8
            buraco[i].flag = true
            toupeira[i]:play()
            toupeira[i]:addEventListener("tap", toupeiratouch)
            buraco[i].flag = false 
            sceneGroup:insert(toupeira[i])                 
        end
    end

    function backgroundtouch(event, self)

    	if event.phase == 'began' and self.name == "fundo" then
    		audio.play(errou)
            timer.pause(jogotmp)
            --composer.removeScene("stage")
            --composer.gotoScene("pontos")
    	end

    end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
    return scene
    -------------------------------------------------------------------------------------------------------------