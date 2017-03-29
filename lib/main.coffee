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

    atom.config.observe 'tool-bar.fullWidth', (value) ->
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
  if typeof atom.config.defaultSettings['tool-bar'] is 'undefined'
    removeToolbarClass()
  else
    toolbarVisible = atom.config.defaultSettings['tool-bar'].visible
    toolBarPosition = atom.config.defaultSettings['tool-bar'].position
    toolBarFullWidth = atom.config.defaultSettings['tool-bar'].fullWidth
    if typeof atom.config.settings['tool-bar'] isnt 'undefined'
      toolbarVisible = if typeof atom.config.settings['tool-bar'].visible is 'undefined' then atom.config.defaultSettings['tool-bar'].visible else atom.config.settings['tool-bar'].visible
      toolBarPosition = if typeof atom.config.settings['tool-bar'].position is 'undefined' then atom.config.defaultSettings['tool-bar'].position else atom.config.settings['tool-bar'].position
      toolBarFullWidth = if typeof atom.config.settings['tool-bar'].fullWidth is 'undefined' then atom.config.defaultSettings['tool-bar'].fullWidth else atom.config.settings['tool-bar'].fullWidth
    if !toolbarVisible
      removeToolbarClass()
    else
      removeToolbarClass()
      document.body.className += " has-tool-bar tool-bar-" + toolBarPosition.toLowerCase() + ' tool-bar-' + ( if toolBarFullWidth then '' else 'not-' ) + 'full-width'

removeToolbarClass = ->
  bodyClassesStr = document.body.className
  newBodyClassesStr = bodyClassesStr
  newBodyClassesStr = newBodyClassesStr.replace(' has-tool-bar', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-full-width', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-not-full-width', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-top', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-top', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-right', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-bottom', '')
  newBodyClassesStr = newBodyClassesStr.replace(' tool-bar-left', '')
  newBodyClassesStr = newBodyClassesStr.replace('  ', ' ')
  document.body.className = newBodyClassesStr;
