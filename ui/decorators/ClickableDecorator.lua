local BaseDecorator = require('ui.decorators.BaseDecorator');

local ClickableDecorator = {};

function ClickableDecorator.new(command, x, y, w, h)
    local self = BaseDecorator.new();

    function self:mousepressed(mx, my, b)
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        if px + x < mx and px + x + pw + w > mx and py + y < my and py + y + ph + h > my then
            command:execute();
        else
            self.child:mousepressed(mx, my, b);
        end
    end

    return self;
end

return ClickableDecorator;
