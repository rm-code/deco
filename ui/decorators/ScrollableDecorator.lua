local BaseDecorator = require('ui.decorators.BaseDecorator');

local ScrollableDecorator = {};

local MAX_VELOCITY = 8;
local SCROLL_SPEED = 2;
local DAMPING = 8;

function ScrollableDecorator.new(x, y, w, h, anchorHor, anchorVer)
    local self = BaseDecorator.new();

    local scrollVelocity = 0;

    function self:update(dt)
        -- Reduce the scrolling velocity over time.
        if scrollVelocity < -0.5 then
            scrollVelocity = scrollVelocity + dt * DAMPING;
        elseif scrollVelocity > 0.5 then
            scrollVelocity = scrollVelocity - dt * DAMPING;
        else
            scrollVelocity = 0;
        end

        -- Clamp velocity to prevent too fast scrolling.
        scrollVelocity = math.max(-MAX_VELOCITY, math.min(scrollVelocity, MAX_VELOCITY));

        -- Update the position of the scrolled content.
        local ox, oy = self.child:getContentOffset();
        self.child:setContentOffset(ox, oy + scrollVelocity);

        self.child:update(dt);
    end

    function self:mousepressed(mx, my, b)
        local px, py = self:getPosition();
        local pw, ph = self:getDimensions();

        -- Check if the mousepointer is over the scroll panel before applying scroll.
        if px + x < mx and px + x + pw + w > mx and py + y < my and py + y + ph + h > my then
            if b == 'wu' then
                scrollVelocity = scrollVelocity > 0 and 0 or scrollVelocity;
                scrollVelocity = scrollVelocity - SCROLL_SPEED;
            elseif b == 'wd' then
                scrollVelocity = scrollVelocity < 0 and 0 or scrollVelocity;
                scrollVelocity = scrollVelocity + SCROLL_SPEED;
            end
        end

        self.child:mousepressed(mx, my, b);
    end

    function self:setDimensions(nw, nh)
        local pw, ph = self:getDimensions();
        if anchorHor then w = w + (pw - nw) end
        if anchorVer then h = h + (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return ScrollableDecorator;
