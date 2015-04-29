local BaseDecorator = require('ui.decorators.BaseDecorator');

local ImageDecorator = {};

function ImageDecorator.new(img, x, y, w, h)
    local self = BaseDecorator.new();

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        love.graphics.draw(img, px + x, py + y, 0, (pw + w) / img:getWidth(), (ph + h) / img:getHeight());
    end

    return self;
end

return ImageDecorator;
