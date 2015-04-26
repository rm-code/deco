local BaseDecorator = require('ui.decorators.BaseDecorator');

local TextDecorator = {};

function TextDecorator.new(text, x, y, w, h)
    local self = BaseDecorator.new();

    local ox, oy = 0, 0;

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        love.graphics.setScissor(px + x, py + y, w, h);
        love.graphics.printf(text, px + x + ox, py + y + oy, w);
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
