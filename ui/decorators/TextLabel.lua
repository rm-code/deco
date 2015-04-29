local BaseDecorator = require('ui.decorators.BaseDecorator');

local TextLabel = {};

function TextLabel.new(text, rgba, font, x, y, w)
    local self = BaseDecorator.new();

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        love.graphics.setFont(font);
        love.graphics.setColor(rgba);
        love.graphics.printf(text, px + x, py + y, pw + w);
        love.graphics.setColor(255, 255, 255, 255);
    end

    return self;
end

return TextLabel;
