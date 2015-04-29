local BaseDecorator = require('ui.decorators.BaseDecorator');

local TextDecorator = {};

function TextDecorator.new(text, x, y, w, h)
    local self = BaseDecorator.new();

    local ox, oy = 0, 0;

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        love.graphics.setScissor(px + x, py + y, pw + w, ph + h);
        love.graphics.printf(text, px + x + ox, py + y + oy, pw + w);
        love.graphics.setScissor();
    end

    function self:getContentOffset()
        return ox, oy;
    end

    function self:setContentOffset(nox, noy)
        ox, oy = nox, noy;
    end

    return self;
end

return TextDecorator;
