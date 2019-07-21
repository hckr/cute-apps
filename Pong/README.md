# Pong

A simple pong game written in QML.

As QML is a declarative language, I imagined my implementation to also be declarative. That's why there is a `Game` component which should have two `Paddle`s and a `Ball` inside. Each `Paddle` should have either `ManualControls` or `ComputerControls`. I'm not sure wheather it worked out, but I've surely learned a bit more about QML.

## How to play / customize

By default the game starts in `'vertical'` `orientation`. You can change it to `'horizontal'` in `Game` properties. For controls please see which are set in `Paddle`s – you can replace manual with computer and vice versa, change the keys etc.

## Current limitations

The main limitation is the lack of a menu. I might implement it in the future.

### Implementation details

`Game` must have an `id` `'game'`, `Paddle`s – `id`s `'player1'` and `'player2'`, and `Ball` – `id` `'ball'`. They could probably be abstracted away (for example by searching through each `parent` until a `Game` or other component), but I don't see it as a much disadvantage (hence not worth the effort).
