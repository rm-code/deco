local BaseDecorator = require('ui.decorators.BaseDecorator');

local BoxDecorator = {};

function BoxDecorator.new(mode, rgba, x, y, w, h, anchorHor, anchorVer)
    local self = BaseDecorator.new();

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        love.graphics.setColor(rgba);
        love.graphics.rectangle(mode, px + x, py + y, pw + w, ph + h)
        love.graphics.setColor(255, 255, 255, 255);
    end

    function self:setDimensions(nw, nh)
        local pw, ph = self:getDimensions();
        if anchorHor then w = w + (pw - nw) end
        if anchorVer then h = h + (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return BoxDecorator;
