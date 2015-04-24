local BaseDecorator = {};

function BaseDecorator.new()
    local self = {
        super = nil;
    };

    function self:draw()
        self.super:draw();
    end

    function self:update(dt)
        self.super:update(dt);
    end

    function self:intersects(cx, cy)
        return self.super:intersects(cx, cy);
    end

    function self:mousemoved(mx, my, dx, dy)
        self.super:mousemoved(mx, my, dx, dy);
    end

    function self:mousepressed(mx, my, b)
        self.super:mousepressed(mx, my, b);
    end

    function self:mousereleased(mx, my, b)
        self.super:mousepressed(mx, my, b);
    end

    function self:attach(nsuper)
        if not self.super then
            self.super = nsuper;
        else
            self.super:attach(nsuper);
        end
    end

    function self:setPosition(nx, ny)
        self.super:setPosition(nx, ny);
    end

    function self:setDimensions(nw, nh)
        self.super:setDimensions(nw, nh)
    end

    function self:getPosition()
        return self.super:getPosition();
    end

    function self:getDimensions()
        return self.super:getDimensions();
    end

    return self;
end

return BaseDecorator;
