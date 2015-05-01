local BaseDecorator = require('ui.decorators.BaseDecorator');

local ImageDecorator = {};

function ImageDecorator.new(img, x, y, w, h, fixedW, fixedH, fixedPosX, fixedPosY)
    local self = BaseDecorator.new();

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        love.graphics.draw(img, px + x, py + y, 0, (pw + w) / img:getWidth(), (ph + h) / img:getHeight());
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

return ImageDecorator;
