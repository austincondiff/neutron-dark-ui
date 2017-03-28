root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'one-dark-ui.fontSize', (value) ->
      setFontSize(value)

    atom.config.observe 'one-dark-ui.layoutMode', (value) ->
      setLayoutMode(value)

    atom.config.observe 'one-dark-ui.tabSizing', (value) ->
      setTabSizing(value)

    atom.config.observe 'tool-bar.position', (value) ->
      addToolbarClass(value)

    atom.config.observe 'tool-bar.visible', (value) ->
      addToolbarClass(value)

  deactivate: ->
    unsetFontSize()
    unsetLayoutMode()
    unsetTabSizing()

# Font Size -----------------------
setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''

# Layout Mode -----------------------
setLayoutMode = (layoutMode) ->
  root.setAttribute('theme-one-dark-ui-layoutmode', layoutMode.toLowerCase())

unsetLayoutMode = ->
  root.removeAttribute('theme-one-dark-ui-layoutmode')

# Tab Sizing -----------------------
setTabSizing = (tabSizing) ->
  root.setAttribute('theme-one-dark-ui-tabsizing', tabSizing.toLowerCase())

unsetTabSizing = ->
  root.removeAttribute('theme-one-dark-ui-tabsizing')

addToolbarClass = (value) ->
  console.log(atom.config)
  console.log((typeof atom.config.defaultSettings['tool-bar']))
  if typeof atom.config.defaultSettings['tool-bar'] is 'undefined'
    removeToolbarClass()
  else
    console.log('Tool bar is active, adding class')
    if atom.config.settings['tool-bar'].visible is false
      removeToolbarClass()
    else
      toolBarPosition = atom.config.settings['tool-bar'].position
      console.log(toolBarPosition,'HI!!!')
      removeToolbarClass()
      if toolBarPosition is undefined
        toolBarPosition = 'top'
      document.body.className += " has-tool-bar tool-bar-" + toolBarPosition.toLowerCase()

removeToolbarClass = ->
  bodyClassesStr = document.body.className
  newBodyClassesStr = bodyClassesStr
  newBodyClassesStr = newBodyClassesStr.replace(' has-tool-bar', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-top', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-right', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-bottom', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-left', '')
  newBodyClassesStr = newBodyClassesStr.replace('  ', ' ')
  document.body.className = newBodyClassesStr;
