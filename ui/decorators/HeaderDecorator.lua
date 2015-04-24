local BaseDecorator = require('ui.decorators.BaseDecorator');

local HeaderDecorator = {};

function HeaderDecorator.new(baseCol, highlightCol, x, y, w, h)
    local self = BaseDecorator.new();

    local currentCol = baseCol;
    local drag = false;

    function self:draw()
        self.super:draw();
        local px, py = self:getPosition();
        love.graphics.setColor(currentCol);
        love.graphics.rectangle('fill', px + x, py + y, w, h);
        love.graphics.setColor(200, 200, 200, 255);
        love.graphics.rectangle('line', px + x, py + y, w, h);
        love.graphics.setColor(255, 255, 255, 255);
    end

    function self:intersects(cx, cy)
        local px, py = self:getPosition();

        if px + x < cx and px + x + w > cx and py + y < cy and py + h > cy then
            currentCol = highlightCol;
            return true;
        else
            currentCol = baseCol;
            return self.super:intersects(cx, cy);
        end
    end

    function self:mousepressed(mx, my, b)
        local px, py = self:getPosition();

        if b == 'l' and px + x < mx and px + x + w > mx and py + y < my and py + h > my then
            drag = true;
            return;
        end
        self.super:mousepressed(mx, my, b);
    end

    function self:update(dt)
        self:intersects(love.mouse.getPosition());
    end

    function self:mousereleased(mx, my, b)
        drag = false;
        self.super:mousereleased(mx, my, b);
    end

    function self:mousemoved(mx, my, dx, dy)
        local px, py = self:getPosition();

        if drag then
            self:setPosition(px + x + dx, py + y + dy);
        else
            self.super:mousemoved(mx, my, dx, dy)
        end
    end

    return self;
end

return HeaderDecorator;
