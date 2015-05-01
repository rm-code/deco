local BaseDecorator = require('ui.decorators.BaseDecorator');

local TextLabel = {};

local function new(t, text, rgba, font, x, y, fixedW, fixedH, fixedPosX, fixedPosY)
    local self = BaseDecorator();

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        love.graphics.setFont(font);
        love.graphics.setColor(rgba);
        love.graphics.print(text, px + x, py + y);
        love.graphics.setColor(255, 255, 255, 255);
    end

    function self:setDimensions(nw, nh)
        local pw, ph = self:getDimensions();
        if fixedW then w = w + (pw - nw) end
        if fixedH then h = h + (ph - nh) end
        if fixedPosX then x = x - (pw - nw) end
        if fixedPosY then y = y - (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return setmetatable(TextLabel, { __call = new });
