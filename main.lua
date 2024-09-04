local love = require 'love'
local button = require 'Button'

local border = {
	x = 5,
	y = 5,
	width = love.graphics.getWidth() - 10,
	height = love.graphics.getHeight() - 10,
	rx = 10,
	ry = 10
}

local snake = {
	size = 2,
	points = 0,
}

local buttons = {
	start_game = {},
	paused_game = {},
	ended_game = {}
}

function love.load()
	love.window.setTitle("Snake")

	buttons.start_game = button()
end

function love.update(dt)
	
end

function love.keypressed(key)
	
end

function love.draw()
	love.graphics.setColor(1, 0, 0)
	love.graphics.rectangle("line", border.x, border.y, border.width, border.height, border.rx, border.ry)

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("teste", 100, 100)
end