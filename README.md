[![npm version](https://badge.fury.io/js/hubot-praise.svg)](http://badge.fury.io/js/hubot-praise)
# hubot-praise

Allows you to use Hubot for praising a colleague, send them an awesome gif and a random praising message. You can also append your own reason for thanking the person.

Hubot logs all praises so you can do some data analasys of all the praises done ever. To see who did you just ask hubot `hubot who praised`

See [`src/praise.coffee`](src/praise.coffee) for full documentation.

See [this page](http://marthyn.github.io/hubot-praise) for all the GIFS and more fun with this package.

## Installation

In hubot project repo, run:

`npm install hubot-praise --save`

Then add **hubot-praise** to your `external-scripts.json`:

```json
[
  "hubot-praise"
]
```

## Sample Interaction
Between current user @cortana and @masterchief

```
cortana> hubot high five @cortana
hubot> you can’t high five yourself. that’s just clapping
cortana> hubot praise @masterchief
hubot> @cortana high fives @masterchief
hubot> The world is a better place with you around, @masterchief
hubot> http://i.giphy.com/3o85xr46bezqkTazsc.gif
```
![gif](http://i.giphy.com/3o85xr46bezqkTazsc.gif)

## Contributing

There are tests! So run them when you are working on the code. Other than that you know the drill, fork it, pull request it and tada!

### Add more gifs!

We can always use more gifs so if you find an awesome high five gif thats not in here already please add it!

### Add more praise!

You can also add a new praise line, something you would say to someone who's being totally awesome!

## Licensing and Inspiration

First and foremost, inspiration came from [Ben Straub](https://github.com/ben). He gave a talk at [Joy of coding](https://twitter.com/joyofcoding) about [Hubot](https://hubot.github.com/). We left out the gift cards for now though :smile:.

This script was heavily inspired by [hubot-motivate](https://github.com/hubot-scripts/hubot-motivate) and [hubot-highfive](https://github.com/wjbeckett/hubot-highfive). I used some code and some images and texts, but extended it with storage and more images and texts.

Other than that, standard (MIT License)[http://opensource.org/licenses/MIT]
