--==================================================================================================
-- Copyright (C) 2015 by Robert Machmer                                                            =
--                                                                                                 =
-- Permission is hereby granted, free of charge, to any person obtaining a copy                    =
-- of this software and associated documentation files (the "Software"), to deal                   =
-- in the Software without restriction, including without limitation the rights                    =
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell                       =
-- copies of the Software, and to permit persons to whom the Software is                           =
-- furnished to do so, subject to the following conditions:                                        =
--                                                                                                 =
-- The above copyright notice and this permission notice shall be included in                      =
-- all copies or substantial portions of the Software.                                             =
--                                                                                                 =
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR                      =
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,                        =
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE                     =
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER                          =
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,                   =
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN                       =
-- THE SOFTWARE.                                                                                   =
--==================================================================================================

local BaseDecorator = require('ui.decorators.BaseDecorator');

local Scrollable = {};

local MAX_VELOCITY = 8;
local SCROLL_SPEED = 2;
local DAMPING = 8;

local function new(t, x, y, w, h, fixedW, fixedH, fixedPosX, fixedPosY)
    local self = BaseDecorator();

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
        if fixedW then w = w + (pw - nw) end
        if fixedH then h = h + (ph - nh) end
        if fixedPosX then x = x - (pw - nw) end
        if fixedPosY then y = y - (ph - nh) end
        self.child:setDimensions(nw, nh);
    end

    return self;
end

return setmetatable(Scrollable, { __call = new });
