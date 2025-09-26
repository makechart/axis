module.exports =
  pkg:
    name: 'axis', version: '0.0.1'
    extend: {name: "@makechart/base"}
    dependencies: []
  init: ({root, context, pubsub}) ->
    pubsub.fire \init, mod: mod {context} .then ~> it.0

mod = ({context}) ->
  {d3,forceBoundary,ldcolor,repeatString$,infinite} = context
  sample: ->
    raw: [0 to 7].map (val) ~> {val: val, name: val}
    binding:
      name: {key: \name}
      value: {key: \val}
  config: {}
  dimension:
    value: {type: \R, name: "value"}
    name: {type: \N, name: "name"}
  init: ->
    @ab = d3.axisBottom!
    @scale = x: d3.scaleLinear!
    @g = d3.select @svg .append \g

  parse: ->

  resize: ->
    @scale.x.domain [0, 20] .range [20, @box.width - 20]
    @ab.scale @scale.x .tickValues [0 to 20]

  render: ->
    @g.call @ab
