###
The MIT License (MIT)

Copyright (c) 2014 MRW Neundorf <matt@nax.me>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
###
'use strict'

root = process.cwd()
Sonea = require root + '/index.js'
config = require root + '/lib/config/config'

app = null

describe "Sonea Test", ->
  describe "General Test", ->
    before (done) ->
      app = new Sonea
      done()

    it 'should have sonea as site title in opts', (done) ->
      app.opts.site.title.should.equal 'Sonea'
      done()

    it 'should have the cwd path in opts', (done) ->
      app.opts.cwd.should.equal process.cwd()
      done()

    it 'should have port process.env.PORT or config.port ('+config.port+') in opts', (done) ->
      app.opts.port.should.equal process.env.PORT or config.port
      done()

    it 'should have viewEngine jade in opts', (done) ->
      app.opts.viewEngine.should.equal 'jade'
      done()

    it 'should give me the app after start', (done) ->
      app.start ($)->
        app.should.equal $
        done()

