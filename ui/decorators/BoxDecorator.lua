local BaseDecorator = require('ui.decorators.BaseDecorator');

local BoxDecorator = {};

function BoxDecorator.new(baseCol, highlightCol, x, y, w, h)
    local self = BaseDecorator.new();

    local currentCol = baseCol;

    function self:draw()
        self.super:draw();
        local px, py = self.super:getPosition();
        love.graphics.setColor(currentCol);
        love.graphics.rectangle('fill', px + x, py + y, w, h)
        love.graphics.setColor(255, 255, 255, 100);
        love.graphics.rectangle('line', px + x, py + y, w, h)
        love.graphics.setColor(255, 255, 255, 255);
    end

    function self:update(dt)
        self:intersects(love.mouse.getPosition());
    end

    function self:intersects(cx, cy)
        local px, py = self.super:getPosition();

        if px + x < cx and px + x + w > cx and py + y < cy and py + y + h > cy then
            currentCol = highlightCol;
            return true;
        else
            currentCol = baseCol;
            return self.super:intersects(cx, cy);
        end
    end

    return self;
end

return BoxDecorator;
