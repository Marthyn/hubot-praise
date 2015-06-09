chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'praise', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/praise')(@robot)

  it 'registers a respond listener for hubot praise', ->
    expect(@robot.respond).to.have.been.calledWith(/high five ([^ ]*)( (.*))?/i)

  it 'registers a respond listener for hubot high five', ->
    expect(@robot.respond).to.have.been.calledWith(/praise ([^ ]*)( (.*))?/i)

  it 'registers a respond listener for hubot who praised', ->
    expect(@robot.respond).to.have.been.calledWith(/who praised/i)
