local BaseDecorator = require('ui.decorators.BaseDecorator');

local Resizable = {};

function Resizable.new(x, y, w, h, anchorHor, anchorVer)
    local self = BaseDecorator.new();

    local resize = false;

    function self:mousepressed(mx, my, b)
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        if b == 'l' and px + x < mx and px + x + pw + w > mx and py + y < my and py + y + ph + h > my then
            resize = true;
            return;
        end
        self.child:mousepressed(mx, my, b);
    end

    function self:mousereleased(mx, my, b)
        resize = false;
        self.child:mousereleased(mx, my, b);
    end

    function self:mousemoved(mx, my, dx, dy)
        local px, py = self:getPosition();

        if resize then
            local px, py = self:getPosition();
            local pw, ph = self:getDimensions();
            local w, h = mx - px, my - py;
            self:setDimensions(w, h);
        else
            self.child:mousemoved(mx, my, dx, dy)
        end
    end

    function self:setDimensions(nw, nh)
        local pw, ph = self:getDimensions();
        if anchorHor then w = w + (pw - nw) end
        if anchorVer then h = h + (ph - nh) end
        x = x - (pw - nw);
        y = y - (ph - nh);
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return Resizable;
