local BaseDecorator = require('ui.decorators.BaseDecorator');

local TextArea = {};

function TextArea.new(text, x, y, w, h, anchorHor, anchorVer)
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

    function self:setDimensions(nw, nh)
        local pw, ph = self:getDimensions();
        if anchorHor then w = w + (pw - nw) end
        if anchorVer then h = h + (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return TextArea;
