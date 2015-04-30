local BaseDecorator = require('ui.decorators.BaseDecorator');

local ImageDecorator = {};

function ImageDecorator.new(img, x, y, w, h, anchorHor, anchorVer)
    local self = BaseDecorator.new();

    function self:draw()
        self.child:draw();
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        love.graphics.draw(img, px + x, py + y, 0, (pw + w) / img:getWidth(), (ph + h) / img:getHeight());
    end

    function self:setDimensions(nw, nh)
        local pw, ph = self:getDimensions();
        if anchorHor then w = w + (pw - nw) end
        if anchorVer then h = h + (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return ImageDecorator;
