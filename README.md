# Deco

Deco is a user interface library for the [LÖVE](https://www.love2d.org/) framework written in Lua and __currently in development__.

Deco provides a set of small building blocks, which can be used to put together more complicated UI elements. By keeping coupling between different elements to a minimum, the different elements can be combined freely and therefore make it easy to extend the UI with new features or adjust existing ones.

It was written as a replacement for the old UI code in the git visualisation software [LoGiVi](https://github.com/rm-code/logivi).

## Example

For example this code creates an image panel, which can be dragged around freely and highlights its contents when the mouse is hovering over it:

```lua
local SimplePanel = {};

function SimplePanel.new(x, y, w, h)
    local bodyBaseCol = { 80, 80, 80, 255 };
    local shadowCol = { 20, 20, 20, 100 };
    local hlCol = { 255, 255, 255, 80 };

    local img = love.graphics.newImage('example.jpg');

    local self = BaseDecorator.new();
    self:attach(DraggableDecorator  .new(0, 0, 0, 0));
    self:attach(MouseOverDecorator  .new(hlCol, 0, 0, 0, 0));
    self:attach(ImageDecorator      .new(img, 1, 1, -2, -2));
    self:attach(BoxDecorator        .new('fill', bodyBaseCol, 0, 0, 0, 0));
    self:attach(BoxDecorator        .new('fill', shadowCol, 8, 8, 0, 0));
    self:attach(BaseComponent       .new(x, y, w, h));
    return self;
end

return SimplePanel;
```

Want to add a header? Simply add more decorators. Want to make it static? Remove the _draggable_ decorator.

## Contributing

This library is in early stages of development and is in dire need of some "_real-world_" testing.

If you find bugs, or have suggestions & improvements, please consider opening a pull request or a ticket in the issue tracker.

## License

The MIT License (MIT)

Copyright (c) 2015 Robert Machmer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
