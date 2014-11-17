local _W, _H = display.contentWidth, display.contentHeight
local _CX, _CY = _W * 0.5, _H * 0.5

-- x = 0, y = 0 - top left corner
-- x = _W, y = _H - bottom right corner

display.setStatusBar(display.HiddenStatusBar)

display.setDefault('background', 0.5, 0, 0)

local s = 70

local frame = display.newRect(_CX, _CY, _W - 2, _H - 2)
frame:setFillColor(0)
frame.strokeWidth = 1

local topLeftRect = display.newRect(0, 0, s, s)
topLeftRect.anchorX, topLeftRect.anchorY = 0, 0

local bottomRightRect = display.newRect(_W, _H, s, s)
bottomRightRect.anchorX, bottomRightRect.anchorY = 1, 1

local contentSizeText = display.newText{
    x = _CX, y = _CY - 100,
    fontSize = 14,
    text = 'Content: ' .. display.actualContentWidth .. ' x ' .. display.actualContentHeight
}

local suffix = display.imageSuffix or 'none'
local suffixText = display.newText{
    x = _CX, y = _CY - 50,
    fontSize = 14,
    text = 'Suffix: ' .. suffix
}

local scale = display.pixelHeight / display.actualContentHeight
local scaleText = display.newText{
    x = _CX, y = _CY,
    fontSize = 14,
    text = 'Scale: ' .. scale
}

local pixelPerfect = 'no'
if scale == 3 then
    pixelPerfect = 'kinda'
elseif scale == 1 or scale % 2 == 0 then
    pixelPerfect = 'yes'
end
local pixelText = display.newText{
    x = _CX, y = _CY + 50,
    fontSize = 14,
    text = 'Pixel perfect: ' .. pixelPerfect
}

print('Content', display.actualContentWidth .. ' x ' .. display.actualContentHeight)
print('Suffix', suffix)
print('Scale', scale)
print('Pixel perfect', pixelPerfect)