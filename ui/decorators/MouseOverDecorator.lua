local BaseDecorator = require('ui.decorators.BaseDecorator');

local MouseOverDecorator = {};

function MouseOverDecorator.new(highlightCol, x, y, w, h)
    local self = BaseDecorator.new();

    local mouseOver = true;

    function self:draw()
        self.child:draw();
        if mouseOver then
            local px, py = self:getPosition();
            love.graphics.setColor(highlightCol);
            love.graphics.rectangle('fill', px + x, py + y, w, h);
            love.graphics.setColor(255, 255, 255, 255);
        end
    end

    function self:update(dt)
        self:intersects(love.mouse.getPosition());
    end

    function self:intersects(cx, cy)
        local px, py = self.child:getPosition();

        if px + x < cx and px + x + w > cx and py + y < cy and py + y + h > cy then
            mouseOver = true;
            return true;
        else
            mouseOver = false;
            return self.child:intersects(cx, cy);
        end
    end

    return self;
end

return MouseOverDecorator;
