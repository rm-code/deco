local BaseDecorator = require('ui.decorators.BaseDecorator');

local ClickableDecorator = {};

function ClickableDecorator.new(func, x, y, w, h)
    local self = BaseDecorator.new();

    function self:mousepressed(mx, my, b)
        local px, py = self.child:getPosition();
        if px + x < mx and px + x + w > mx and py + y < my and py + y + h > my then
            func();
        else
            self.child:mousepressed(mx, my, b);
        end
    end

    return self;
end

return ClickableDecorator;
