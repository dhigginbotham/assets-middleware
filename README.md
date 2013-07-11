assets-middleware
=================

I wrote this because I didn't really need something super complex, just simple and easy to use. It relies on
`req.route.path` to ensure it's loading scripts in the right place.

### Installation

Step 1) `npm install git+https://github.com/dhigginbotham/assets-middleware --save`

Step 2) explore `/examples` folder/files

Step 3) Use like any regular middleware

#### Create array of assets

```coffee
middleware = (req, res, next) ->

  scripts = [
    # css for app
    {src: '/stylesheets/normalize.css', name: 'normalize', where: 'head', uri: null, type: 'css', exclude: null}
    {src: '/stylesheets/app.css', name: 'app', where: 'head', uri: null, type: 'css', exclude: null}
    {src: '/stylesheets/custom.css', name: 'custom', where: 'head', uri: null, type: 'css', exclude: null}
    {src: '//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css', name: 'font-awesome.css', where: 'head', 
    uri: null, type: 'css', exclude: null}
  ]

  opts = 
    assets: scripts

  assets = new asset req, opts

  assets.make (embed) ->
    res.locals.assets = embed
    next()
```
#### Includes files

```jade
//- head.jade

if (assets)
  each asset in assets.head.css
    link(href="#{asset.src}", rel="stylesheet")
  each asset in assets.head.js
    script(type="text/javascript", src="#{asset.src}")
```

```jade
//- foot.jade

if (assets)
  each asset in assets.foot.css
    link(href="#{asset.src}", rel="stylesheet")
  each asset in assets.foot.js
    script(type="text/javascript", src="#{asset.src}")
```
### License

```md
The MIT License (MIT)

Copyright (c) 2013 David Higginbotham 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```