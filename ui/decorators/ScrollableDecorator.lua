local BaseDecorator = require('ui.decorators.BaseDecorator');

local ScrollableDecorator = {};

function ScrollableDecorator.new(x, y, w, h)
    local self = BaseDecorator.new();

    function self:mousepressed(mx, my, b)
        if b == 'wu' then
            local ox, oy = self.child:getContentOffset();
            self.child:setContentOffset(ox, oy - 4);
        elseif b == 'wd' then
            local ox, oy = self.child:getContentOffset();
            self.child:setContentOffset(ox, oy + 4);
        else
            self.child:mousepressed(mx, my, b);
        end
    end

    return self;
end

return ScrollableDecorator;
