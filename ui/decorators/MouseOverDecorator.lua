local BaseDecorator = require('ui.decorators.BaseDecorator');

local MouseOverDecorator = {};

local function new(t, highlightCol, x, y, w, h, fixedW, fixedH, fixedPosX, fixedPosY)
    local self = BaseDecorator();

    local mouseOver = true;

    function self:draw()
        self.child:draw();
        if mouseOver then
            local px, py = self:getPosition();
            local pw, ph = self:getDimensions();
            love.graphics.setColor(highlightCol);
            love.graphics.rectangle('fill', px + x, py + y, pw + w, ph + h);
            love.graphics.setColor(255, 255, 255, 255);
        end
    end

    function self:update(dt)
        self:intersects(love.mouse.getPosition());
        self.child:update(dt);
    end

    function self:intersects(cx, cy)
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();
        if px + x < cx and px + x + pw + w > cx and py + y < cy and py + y + ph + h > cy then
            mouseOver = true;
            return true;
        else
            mouseOver = false;
            return self.child:intersects(cx, cy);
        end
    end

    function self:setDimensions(nw, nh)
        local pw, ph = self:getDimensions();
        if fixedW then w = w + (pw - nw) end
        if fixedH then h = h + (ph - nh) end
        if fixedPosX then x = x - (pw - nw) end
        if fixedPosY then y = y - (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return setmetatable(MouseOverDecorator, { __call = new });
