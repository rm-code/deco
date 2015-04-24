# User Interface

This is an attempt to create my own user interface for the [LÖVE](https://www.love2d.org/) framework. I'm using the [Decorator](http://en.wikipedia.org/wiki/Decorator_pattern) pattern to keep the coupling to a minimum and make the different classes flexible.

The main benefit of this approach is, that many different interface items with varying complexity can simply be put together from the same basic building blocks. Most importantly the functionality of one decorator block is completely separated from the others. This also means that functionality can be added and removed on the fly.

For example a window can easily become draggable, by just adding a draggable decorator object:

``` 
self:attach(DraggableDecorator.new(0, 0, w, h));
```

This library is in early stages of development and will probably change a lot in the near future. 

If you find bugs, or have suggestions & improvements, please consider opening a pull request or a ticket in the issue tracker.
