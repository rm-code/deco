local BaseDecorator = require('ui.decorators.BaseDecorator');

local BoxDecorator = {};

function BoxDecorator.new(mode, rgba, x, y, w, h)
    local self = BaseDecorator.new();

    function self:draw()
        self.child:draw();
        local px, py = self.child:getPosition();
        love.graphics.setColor(rgba);
        love.graphics.rectangle(mode, px + x, py + y, w, h)
        love.graphics.setColor(255, 255, 255, 255);
    end

    return self;
end

return BoxDecorator;
