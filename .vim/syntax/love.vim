runtime! syntax/lua.vim

syn match loveSpecial /love\./
syn match loveFunc /draw/ containedin=loveSpecial
syn match loveFunc /keypressed/ containedin=loveSpecial
syn match loveFunc /keyreleased/ containedin=loveSpecial
syn match loveFunc /mousepressed/ containedin=loveSpecial
syn match loveFunc /mousereleased/ containedin=loveSpecial
syn match loveFunc /conf/ containedin=loveSpecial
syn match loveFunc /load/ containedin=loveSpecial
syn match loveFunc /update/ containedin=loveSpecial


syn match loveSpecialAudio /love\.audio\./
syn match loveFunc /getNumSources/ containedin=loveSpecialAudio
syn match loveFunc /getOrientation/ containedin=loveSpecialAudio
syn match loveFunc /getPosition/ containedin=loveSpecialAudio
syn match loveFunc /getVelocity/ containedin=loveSpecialAudio
syn match loveFunc /getVolume/ containedin=loveSpecialAudio
syn match loveFunc /newSource/ containedin=loveSpecialAudio
syn match loveFunc /newSource1/ containedin=loveSpecialAudio
syn match loveFunc /pause/ containedin=loveSpecialAudio
syn match loveFunc /play/ containedin=loveSpecialAudio
syn match loveFunc /resume/ containedin=loveSpecialAudio
syn match loveFunc /rewind/ containedin=loveSpecialAudio
syn match loveFunc /setOrientation/ containedin=loveSpecialAudio
syn match loveFunc /setPosition/ containedin=loveSpecialAudio
syn match loveFunc /setVelocity/ containedin=loveSpecialAudio
syn match loveFunc /setVolume/ containedin=loveSpecialAudio
syn match loveFunc /stop/ containedin=loveSpecialAudio

syn match loveFunc /errhand/ containedin=loveSpecial

syn match loveSpecialEvent /love\.event\./
syn match loveFunc /poll/ containedin=loveSpecialEvent
syn match loveFunc /pump/ containedin=loveSpecialEvent
syn match loveFunc /push/ containedin=loveSpecialEvent
syn match loveFunc /wait/ containedin=loveSpecialEvent

syn match loveSpecialFile /love\.filesystem\./
syn match loveFunc /enumerate/ containedin=loveSpecialFile
syn match loveFunc /exists/ containedin=loveSpecialFile
syn match loveFunc /getAppdataDirectory/ containedin=loveSpecialFile
syn match loveFunc /getSaveDirectory/ containedin=loveSpecialFile
syn match loveFunc /getUserDirectory/ containedin=loveSpecialFile
syn match loveFunc /getWorkingDirectory/ containedin=loveSpecialFile
syn match loveFunc /init/ containedin=loveSpecialFile
syn match loveFunc /isDirectory/ containedin=loveSpecialFile
syn match loveFunc /isFile/ containedin=loveSpecialFile
syn match loveFunc /lines/ containedin=loveSpecialFile
syn match loveFunc /load/ containedin=loveSpecialFile
syn match loveFunc /mkdir/ containedin=loveSpecialFile
syn match loveFunc /newFile/ containedin=loveSpecialFile
syn match loveFunc /newFileData/ containedin=loveSpecialFile
syn match loveFunc /read/ containedin=loveSpecialFile
syn match loveFunc /remove/ containedin=loveSpecialFile
syn match loveFunc /setIdentity/ containedin=loveSpecialFile
syn match loveFunc /setSource/ containedin=loveSpecialFile
syn match loveFunc /write/ containedin=loveSpecialFile

syn match loveSpecialGraphics /love\.graphics\./
syn match loveFunc /checkMode/ containedin=loveSpecialGraphics
syn match loveFunc /circle/ containedin=loveSpecialGraphics
syn match loveFunc /clear/ containedin=loveSpecialGraphics
syn match loveFunc /draw/ containedin=loveSpecialGraphics
syn match loveFunc /drawq/ containedin=loveSpecialGraphics
syn match loveFunc /drawTest/ containedin=loveSpecialGraphics
syn match loveFunc /getBackgroundColor/ containedin=loveSpecialGraphics
syn match loveFunc /getBlendMode/ containedin=loveSpecialGraphics
syn match loveFunc /getCaption/ containedin=loveSpecialGraphics
syn match loveFunc /getColor/ containedin=loveSpecialGraphics
syn match loveFunc /getColorMode/ containedin=loveSpecialGraphics
syn match loveFunc /getFont/ containedin=loveSpecialGraphics
syn match loveFunc /getHeight/ containedin=loveSpecialGraphics
syn match loveFunc /getLineStipple/ containedin=loveSpecialGraphics
syn match loveFunc /getLineStyle/ containedin=loveSpecialGraphics
syn match loveFunc /getLineWidth/ containedin=loveSpecialGraphics
syn match loveFunc /getMaxPointSize/ containedin=loveSpecialGraphics
syn match loveFunc /getModes/ containedin=loveSpecialGraphics
syn match loveFunc /getPointSize/ containedin=loveSpecialGraphics
syn match loveFunc /getPointStyle/ containedin=loveSpecialGraphics
syn match loveFunc /getScissor/ containedin=loveSpecialGraphics
syn match loveFunc /getWidth/ containedin=loveSpecialGraphics
syn match loveFunc /isCreated/ containedin=loveSpecialGraphics
syn match loveFunc /line/ containedin=loveSpecialGraphics
syn match loveFunc /newFont/ containedin=loveSpecialGraphics
syn match loveFunc /newFont1/ containedin=loveSpecialGraphics
syn match loveFunc /newGlyph/ containedin=loveSpecialGraphics
syn match loveFunc /newImage/ containedin=loveSpecialGraphics
syn match loveFunc /newImageFont/ containedin=loveSpecialGraphics
syn match loveFunc /newParticleSystem/ containedin=loveSpecialGraphics
syn match loveFunc /newQuad/ containedin=loveSpecialGraphics
syn match loveFunc /newScreenshot/ containedin=loveSpecialGraphics
syn match loveFunc /newSpriteBatch/ containedin=loveSpecialGraphics
syn match loveFunc /point/ containedin=loveSpecialGraphics
syn match loveFunc /polygon/ containedin=loveSpecialGraphics
syn match loveFunc /pop/ containedin=loveSpecialGraphics
syn match loveFunc /present/ containedin=loveSpecialGraphics
syn match loveFunc /print/ containedin=loveSpecialGraphics
syn match loveFunc /printf/ containedin=loveSpecialGraphics
syn match loveFunc /push/ containedin=loveSpecialGraphics
syn match loveFunc /quad/ containedin=loveSpecialGraphics
syn match loveFunc /rectangle/ containedin=loveSpecialGraphics
syn match loveFunc /reset/ containedin=loveSpecialGraphics
syn match loveFunc /rotate/ containedin=loveSpecialGraphics
syn match loveFunc /scale/ containedin=loveSpecialGraphics
syn match loveFunc /setBackgroundColor/ containedin=loveSpecialGraphics
syn match loveFunc /setBlendMode/ containedin=loveSpecialGraphics
syn match loveFunc /setCaption/ containedin=loveSpecialGraphics
syn match loveFunc /setColor/ containedin=loveSpecialGraphics
syn match loveFunc /setColorMode/ containedin=loveSpecialGraphics
syn match loveFunc /setFont/ containedin=loveSpecialGraphics
syn match loveFunc /setFont1/ containedin=loveSpecialGraphics
syn match loveFunc /setLine/ containedin=loveSpecialGraphics
syn match loveFunc /setLineStipple/ containedin=loveSpecialGraphics
syn match loveFunc /setLineStyle/ containedin=loveSpecialGraphics
syn match loveFunc /setLineWidth/ containedin=loveSpecialGraphics
syn match loveFunc /setMode/ containedin=loveSpecialGraphics
syn match loveFunc /setPoint/ containedin=loveSpecialGraphics
syn match loveFunc /setPointSize/ containedin=loveSpecialGraphics
syn match loveFunc /setPointStyle/ containedin=loveSpecialGraphics
syn match loveFunc /setScissor/ containedin=loveSpecialGraphics
syn match loveFunc /toggleFullscreen/ containedin=loveSpecialGraphics
syn match loveFunc /translate/ containedin=loveSpecialGraphics
syn match loveFunc /triangle/ containedin=loveSpecialGraphics

syn match loveSpecialHandler /love\.handler\./
syn match loveFunc /jp/ containedin=loveSpecialHandler
syn match loveFunc /jr/ containedin=loveSpecialHandler
syn match loveFunc /kp/ containedin=loveSpecialHandler
syn match loveFunc /kr/ containedin=loveSpecialHandler
syn match loveFunc /mp/ containedin=loveSpecialHandler
syn match loveFunc /mr/ containedin=loveSpecialHandler
syn match loveFunc /q/ containedin=loveSpecialHandler

syn match loveSpecialImage /love\.image\./
syn match loveFunc /newEncodedImageData/ containedin=loveSpecialImage
syn match loveFunc /newImageData/ containedin=loveSpecialImage

syn match loveFunc /love\.joystick\.close/
syn match loveFunc /love\.joystick\.getAxes/
syn match loveFunc /love\.joystick\.getAxis/
syn match loveFunc /love\.joystick\.getBall/
syn match loveFunc /love\.joystick\.getHat/
syn match loveFunc /love\.joystick\.getName/
syn match loveFunc /love\.joystick\.getNumAxes/
syn match loveFunc /love\.joystick\.getNumBalls/
syn match loveFunc /love\.joystick\.getNumButtons/
syn match loveFunc /love\.joystick\.getNumHats/
syn match loveFunc /love\.joystick\.getNumJoysticks/
syn match loveFunc /love\.joystick\.isDown/
syn match loveFunc /love\.joystick\.isOpen/
syn match loveFunc /love\.joystick\.open/

syn match loveSpecialKeyboard /love\.keyboard\./
syn match loveFunc /getKeyRepeat/ containedin=loveSpecialKeyboard
syn match loveFunc /isDown/ containedin=loveSpecialKeyboard
syn match loveFunc /setKeyRepeat/ containedin=loveSpecialKeyboard

syn match loveSpecialMouse /love\.mouse\./
syn match loveFunc /getPosition/ containedin=loveSpecialMouse
syn match loveFunc /getX/ containedin=loveSpecialMouse
syn match loveFunc /getY/ containedin=loveSpecialMouse
syn match loveFunc /isDown/ containedin=loveSpecialMouse
syn match loveFunc /isGrabbed/ containedin=loveSpecialMouse
syn match loveFunc /isVisible/ containedin=loveSpecialMouse
syn match loveFunc /setGrab/ containedin=loveSpecialMouse
syn match loveFunc /setPosition/ containedin=loveSpecialMouse
syn match loveFunc /setVisible/ containedin=loveSpecialMouse

syn match loveSpecialPhysics /love\.physics\./
syn match loveFunc /newBody/ containedin=loveSpecialPhysics
syn match loveFunc /newCircleShape/ containedin=loveSpecialPhysics
syn match loveFunc /newDistanceJoint/ containedin=loveSpecialPhysics
syn match loveFunc /newGearJoint/ containedin=loveSpecialPhysics
syn match loveFunc /newMouseJoint/ containedin=loveSpecialPhysics
syn match loveFunc /newPolygonShape/ containedin=loveSpecialPhysics
syn match loveFunc /newPrismaticJoint/ containedin=loveSpecialPhysics
syn match loveFunc /newPulleyJoint/ containedin=loveSpecialPhysics
syn match loveFunc /newRectangleShape/ containedin=loveSpecialPhysics
syn match loveFunc /newRevoluteJoint/ containedin=loveSpecialPhysics
syn match loveFunc /newWorld/ containedin=loveSpecialPhysics

syn match loveFunc /run/ containedin=loveSpecial

syn match loveSpecialSound /love\.sound\./
syn match loveFunc /newDecoder/ containedin=loveSpecialSound
syn match loveFunc /newSoundData/ containedin=loveSpecialSound

syn match loveSpecialTimer /love\.timer\./
syn match loveFunc /getDelta/ containedin=loveSpecialTimer
syn match loveFunc /getFPS/ containedin=loveSpecialTimer
syn match loveFunc /getMicroTime/ containedin=loveSpecialTimer
syn match loveFunc /getTime/ containedin=loveSpecialTimer
syn match loveFunc /sleep/ containedin=loveSpecialTimer
syn match loveFunc /step/ containedin=loveSpecialTimer

hi link loveSpecial SpecialChar
hi link loveSpecialAudio SpecialChar
hi link loveSpecialFile SpecialChar
hi link loveSpecialGraphics SpecialChar
hi link loveSpecialEvent SpecialChar
hi link loveSpecialHandler SpecialChar
hi link loveSpecialTimer SpecialChar
hi link loveSpecialPhysics SpecialChar
hi link loveSpecialMouse SpecialChar
hi link loveSpecialKeyboard SpecialChar
hi link loveSpecialImage SpecialChar
hi link loveSpecialSound SpecialChar
hi link loveFunc Function
