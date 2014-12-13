Engine = require 'famous/core/Engine'
ImageSurface = require 'famous/surfaces/ImageSurface'

mainContext = Engine.createContext()
mainContext.setPerspective 1000
mainContext.add new ImageSurface
  size: [200, 200]
  content: 'images/famous_logo.png'
