local BaseDecorator = require('ui.decorators.BaseDecorator');

local ScrollableDecorator = {};

function ScrollableDecorator.new(x, y, w, h)
    local self = BaseDecorator.new();

    function self:mousepressed(mx, my, b)
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();

        if px + x < mx and px + x + pw + w > mx and py + y < my and py + y + ph + h > my then
            if b == 'wu' then
                local ox, oy = self.child:getContentOffset();
                self.child:setContentOffset(ox, oy - 4);
            elseif b == 'wd' then
                local ox, oy = self.child:getContentOffset();
                self.child:setContentOffset(ox, oy + 4);
            end
        end
        self.child:mousepressed(mx, my, b);
    end

    return self;
end

return ScrollableDecorator;
