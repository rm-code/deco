local BaseDecorator = require('ui.decorators.BaseDecorator');

local TextLabel = {};

function TextLabel.new(text, rgba, font, x, y)
    local self = BaseDecorator.new();

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        love.graphics.setFont(font);
        love.graphics.setColor(rgba);
        love.graphics.print(text, px + x, py + y);
        love.graphics.setColor(255, 255, 255, 255);
    end

    return self;
end

return TextLabel;
