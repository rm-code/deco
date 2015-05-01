local BaseDecorator = require('ui.decorators.BaseDecorator');

local Draggable = {};

function Draggable.new(x, y, w, h, fixedW, fixedH)
    local self = BaseDecorator.new();

    local drag = false;

    function self:mousepressed(mx, my, b)
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        if b == 'l' and px + x < mx and px + x + pw + w > mx and py + y < my and py + y + ph + h > my then
            drag = true;
            return;
        end
        self.child:mousepressed(mx, my, b);
    end

    function self:mousereleased(mx, my, b)
        drag = false;
        self.child:mousereleased(mx, my, b);
    end

    function self:mousemoved(mx, my, dx, dy)
        local px, py = self:getPosition();

        if drag then
            self:setPosition(px + x + dx, py + y + dy);
        else
            self.child:mousemoved(mx, my, dx, dy)
        end
    end

    function self:setDimensions(nw, nh)
        local pw, ph = self:getDimensions();
        if fixedW then w = w + (pw - nw) end
        if fixedH then h = h + (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return Draggable;
