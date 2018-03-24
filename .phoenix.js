const margin = 5
const resizeAmount = 50

const left = new Key('left', ['cmd'], () => {
  const window = Window.focused()
  const frame = window.screen().flippedVisibleFrame()

  if ( window ) {
    window.setFrame({ 
      x: frame.x + margin,
      y: frame.y + margin,
      width: frame.width * 0.5 - margin * 2,
      height: frame.height - margin * 2
    })
  }
})

const right = new Key('right', ['cmd'], () => {
  const window = Window.focused()
  const frame = window.screen().flippedVisibleFrame()

  if ( window ) {
    window.setFrame({ 
      x: frame.x + frame.width * 0.5 + margin,
      y: frame.y + margin,
      width: frame.width * 0.5 - margin * 2,
      height: frame.height - margin * 2
    })
  }
})

const center = new Key('c', ['shift', 'cmd'], () => {
  const window = Window.focused()
  const frame = window.screen().flippedVisibleFrame()
  const halfWindowWidth = window.frame().width * 0.5
  const halfWindowHeight = window.frame().height * 0.5

  if ( window ) {
    window.setFrame({ 
      x: (frame.x + frame.width * 0.5) - halfWindowWidth,
      y: (frame.y + frame.height * 0.5) - halfWindowHeight,
      width: window.frame().width,
      height: window.frame().height
    })
  }
})

const fullscreen = new Key('s', ['shift', 'cmd'], () => {
  const window = Window.focused()
  const frame = window.screen().flippedVisibleFrame()

  if ( window ) {
    window.setFrame({
      x: frame.x + margin,
      y: frame.y + margin,
      width: frame.width - margin * 2,
      height: frame.height - margin * 2
    })
  }
})


const contract = new Key('j', ['shift', 'cmd'], () => {
  const window = Window.focused()
  const frame = window.frame() 

  if ( window ) {
    window.setFrame({
      x: frame.x + resizeAmount * 0.5,
      y: frame.y + resizeAmount * 0.5,
      width: frame.width - resizeAmount,
      height: frame.height - resizeAmount
    })
  }
})

const expand = new Key('k', ['shift', 'cmd'], () => {
  const window = Window.focused()
  const frame = window.frame() 

  if ( window ) {
    window.setFrame({
      x: frame.x - resizeAmount * 0.5,
      y: frame.y - resizeAmount * 0.5,
      width: frame.width + resizeAmount,
      height: frame.height + resizeAmount
    })
  }
})

const nextScreen = new Key('right', ['shift', 'cmd'], () => {
   if ( Screen.all().length > 1 ) {
     const window = Window.focused()
     const currentFrame = window.screen().flippedVisibleFrame()
     const destinationFrame = window.screen().next().flippedVisibleFrame()

     const x = destinationFrame.x + (( window.frame().x - currentFrame.x ) / currentFrame.width ) * destinationFrame.width
     const y = destinationFrame.y + (( window.frame().y - currentFrame.y ) / currentFrame.height ) * destinationFrame.height

     const width = ( window.frame().width / currentFrame.width ) * destinationFrame.width
     const height = ( window.frame().height / currentFrame.height ) * destinationFrame.height

     if ( window ) {
       window.setFrame({ x, y, width, height })
     }
   }
})

const prevScreen = new Key('left', ['shift', 'cmd'], () => {
   if ( Screen.all().length > 1 ) {
     const window = Window.focused()
     const currentFrame = window.screen().flippedVisibleFrame()
     const destinationFrame = window.screen().previous().flippedVisibleFrame()

     const x = destinationFrame.x + (( window.frame().x - currentFrame.x ) / currentFrame.width ) * destinationFrame.width
     const y = destinationFrame.y + (( window.frame().y - currentFrame.y ) / currentFrame.height ) * destinationFrame.height

     const width = ( window.frame().width / currentFrame.width ) * destinationFrame.width
     const height = ( window.frame().height / currentFrame.height ) * destinationFrame.height

     if ( window ) {
       window.setFrame({ x, y, width, height })
     }
   }
})
