local BaseDecorator = require('ui.decorators.BaseDecorator');

local TextLabel = {};

function TextLabel.new(text, rgba, font, x, y, anchorHor, anchorVer)
    local self = BaseDecorator.new();

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
        if anchorHor then w = w + (pw - nw) end
        if anchorVer then h = h + (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return TextLabel;
