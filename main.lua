	--background
	display.setStatusBar( display.HiddenStatusBar )
	local background = display.newImageRect( "img/fundo.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	--tempo
	local tempo_restante = 60
    local tempo = display.newText( "Tempo", display.contentWidth/2,15, native.systemFontBold, 25 )
    local contagem_regressiva = display.newText( tempo_restante, 0, 0, native.systemFont,12*2)
    contagem_regressiva.x = display.contentWidth/2
    contagem_regressiva.y = display.contentHeight/7.1
    tempo:setFillColor( 9, 9, 9 )
    --pontos
    local pontos_iniciais = 0
    local pontos = display.newText( "Pontos:", display.contentWidth/11,15, native.systemFontBold, 20 )
    tempo:setFillColor( 9, 9, 9 )
    local contagem_pontos = display.newText( pontos_iniciais, 100, 15, native.systemFont,12*2)
    contagem_regressiva.x = display.contentWidth/2
    contagem_regressiva.y = display.contentHeight/7.1
    --som
	--local somDoFundo = audio.loadStream("media/fun")
	local errou = audio.loadSound("media/errou.wav")
	local punch = audio.loadSound("media/punch.wav")
	local derrota = audio.loadSound("media/fail.wav")
	--buracos
	local buraco = {}

	local posx = 60
	local posy = 120

    for i=0,10 do
	     buraco[i] = display.newImage("img/buraco.png")
	     buraco[i].x = posx
	     buraco[i].y = posy

	     posx = posx + 120


	     if i == 3 then
	     	posx = 120
	     	posy = 200
	     elseif i == 6 then
	     	posx = 60
	     	posy = 280
	     end
    end
	
    local function backgroundtouch(e)
    	if e.phase == 'ended' then
    		audio.play(errou)
    		tempo_restante = tempo_restante - 1
    		contagem_regressiva.text = tempo_restante
    	end
    	
    end
    
    background:addEventListener( "touch", backgroundtouch)
    
	local function contagemregressiva()
    	 if tempo_restante > 0 then
    		tempo_restante = tempo_restante - 1
    		contagem_regressiva.text = tempo_restante
    	end
    	

    	if tempo_restante == 0 then
    		audio.play(derrota)
    		timer.cancel(jogotmp)
    		contagem_regressiva.text = "derrota"
    	end
    end

    jogotmp = timer.performWithDelay(1000, contagemregressiva,10000)

	local function toupeiratouch(e)
        
           
    	if e.phase == "began" then
 			tempo_restante = tempo_restante + 2
    		timer.pause(jogotmp)
    	end

    	if(e.phase == "ended") then
    		audio.play(punch)
    		display.remove(e.target)
            pontos_iniciais = pontos_iniciais + 1
            contagem_pontos.text = pontos_iniciais
            timer.resume(jogotmp)
           
    	end
        	
    	return true

 	end
 	
	local function criartoupeira()
		toupeira = {}
		posx = 60
		posy = 120
		
	    i = math.random(10)
		toupeira[i] = display.newImage("img/mole.png" )
		toupeira[i].x = buraco[i].x
		toupeira[i].y = buraco[i].y
	      
		toupeira[i]:addEventListener("touch", toupeiratouch)	    
 	end

 	criatoup = timer.performWithDelay(1800,criartoupeira,2000)
	-------------------------------------------------------------------------------------------------------------