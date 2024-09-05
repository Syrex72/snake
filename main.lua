local love = require 'love'
local button = require 'Button'

-- alterar tamanho para fazer proporção 12x20 quadrados
local game = {
	border = {
		x = 10,
		y = 10,
		width = 410,
		height = 410,
	},
	points = 0
}

local snake = {
	head = {
		direction = "right",
		x = 200,
		y = 200
	},
	tail = {},
	speed = 10,
	size = 10,
	points = 1,

}

local time = {
	last = 0,
	current = 0,
}

print(game.border.width - game.border.x .. ", " .. game.border.height - game.border.y)
print(snake.head.x .. ", " .. snake.head.y )


function love.load()
	love.window.setTitle("Snake")
	
	-- pega o tempo inicial
	time.last = love.timer.getTime()
end

function love.update(dt)
	-- atualiza o tempo, por frame
	time.current = love.timer.getTime() 

	-- garante que as ações so sejam executadas a cada 0.25 segundos
	-- obtem esse tempo por meio da subtração do ultimo frame de movimento salvo e o atual
	if time.current - time.last >= 0.25 then
		-- print(time.current - time.last)w
		if snake.head.direction == "up" then
			-- verificação simples se ele 'saiu' dos limites da borda, repete para todas as direções
			if snake.head.y - snake.speed < game.border.y then
				snake.head.y = game.border.height
			else 
				snake.head.y = snake.head.y - snake.speed
			end

		elseif snake.head.direction == "right" then
			if snake.head.x + snake.speed > game.border.width then
				snake.head.x = game.border.x
			else
				snake.head.x = snake.head.x + snake.speed 
			end

		elseif snake.head.direction == "down" then
			if snake.head.y + snake.speed > game.border.height then
				snake.head.y = game.border.y
			else
				snake.head.y = snake.head.y + snake.speed
			end

		elseif snake.head.direction == "left" then
			if snake.head.x - snake.speed < game.border.x then
				snake.head.x = game.border.width
			else
				snake.head.x = snake.head.x - snake.speed
			end
		end

		-- atualiza o ultimo frame de movimento
		time.last = time.current
	end
	
end

function love.keypressed(key)
	if key == "w" and snake.head.direction ~= "down" then
		snake.head.direction = "up"
	elseif key == "d" and snake.head.direction ~= "left" then
		snake.head.direction = "right"
	elseif key == "s" and snake.head.direction ~= "up" then
		snake.head.direction = "down"
	elseif key == "a" and snake.head.direction ~= "right" then
		snake.head.direction = "left"
	end
end

function love.draw()
	-- mapa 
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("fill", snake.head.x, snake.head.y, snake.size, snake.size)
	
	-- jogador
	love.graphics.setColor(1, 0, 0)
	love.graphics.rectangle("line", game.border.x, game.border.y, game.border.width, game.border.height)

	


end