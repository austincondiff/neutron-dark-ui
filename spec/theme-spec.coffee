describe "Neutron Dark UI theme", ->
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('neutron-dark-ui')

  it "allows the font size to be set via config", ->
    expect(document.documentElement.style.fontSize).toBe ''

    atom.config.set('neutron-dark-ui.fontSize', '10')
    expect(document.documentElement.style.fontSize).toBe '10px'

    atom.config.set('neutron-dark-ui.fontSize', 'Auto')
    expect(document.documentElement.style.fontSize).toBe ''

  it "allows the layout mode to be set via config", ->
    expect(document.documentElement.getAttribute('theme-neutron-dark-ui-layoutmode')).toBe 'auto'

    atom.config.set('neutron-dark-ui.layoutMode', 'Spacious')
    expect(document.documentElement.getAttribute('theme-neutron-dark-ui-layoutmode')).toBe 'spacious'

  it "allows the tab sizing to be set via config", ->
    expect(document.documentElement.getAttribute('theme-neutron-dark-ui-tabsizing')).toBe 'auto'

    atom.config.set('neutron-dark-ui.tabSizing', 'Minimum')
    expect(document.documentElement.getAttribute('theme-neutron-dark-ui-tabsizing')).toBe 'minimum'
