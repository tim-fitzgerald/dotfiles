require("hs.ipc")

-- https://github.com/philc/hammerspoon-config/blob/d2c1046273da4c0140d0b33dd55ee8e637db5e6d/init.lua#L22
hs.alert.defaultStyle.strokeColor = {white = 1, alpha = 0}
hs.alert.defaultStyle.fillColor = {white = 0.05, alpha = 0.75}
hs.alert.defaultStyle.radius = 10

logger = hs.logger.new('debug', 'info');

hyper = {"cmd", "alt", "ctrl", "shift"}
hs.application.enableSpotlightForNameSearches(true)

--- Define default apps 
local defaultApps = {"iTerm", "Firefox", "Obsidian", "Visual Studio Code", "Slack", "Spotify"}

function launchApps()
  for _, app in pairs(defaultApps) do 
    hs.application.launchOrFocus(app)
  end
end

-- Displays and Layouts
function layoutWindows()
  -- ToDo: this needs a refactor, lots of repetition here.
  local screens = hs.screen.allScreens()
  local num_screens = #screens
  local primary_screen = hs.screen.primaryScreen()

  if num_screens == 3 then
    ipad = primary_screen:toSouth()
    laptop_screen = ipad:toEast()
  elseif num_screens == 2 then
    laptop_screen = primary_screen:toSouth()
  end

  local threeWindowLayout = {
    {"iTerm2", nil, primary_screen, hs.geometry.rect(0, 0, 0.333, 1), nil, nil},
    {"Obsidian", nil, primary_screen, hs.geometry.rect(0, 0, 0.333, 1), nil, nil},
    {"Firefox", nil, primary_screen, hs.geometry.rect(0.333,0,0.333, 1), nil, nil},
    {"Code", nil, primary_screen, hs.geometry.rect(0.666, 0, 0.333, 1), nil, nil},
    {"Slack", nil, ipad, hs.layout.maximized, nil, nil},
    {"Spotify", nil, laptop_screen, hs.layout.maximized, nil, nil}
  }

  local twoWindowLayout = {
    {"iTerm2", nil, primary_screen, hs.geometry.rect(0, 0, 0.333, 1), nil, nil},
    {"Obsidian", nil, primary_screen, hs.geometry.rect(0, 0, 0.333, 1), nil, nil},
    {"Firefox", nil, primary_screen, hs.geometry.rect(0.333,0,0.333, 1), nil, nil},
    {"Code", nil, primary_screen, hs.geometry.rect(0.666, 0, 0.333, 1), nil, nil},
    {"Slack", nil, laptop_screen,  hs.layout.maximized, nil, nil}
  }

  local desiredLayout = {}
  if num_screens == 3 then
    desiredLayout = threeWindowLayout
  elseif num_screens == 2 then
    desiredLayout = twoWindowLayout
  end
  hs.layout.apply(desiredLayout)
end

-- I keep iTerm and Obsidian in the same grid section, this allows me to 
-- quickly toggle between which one I want forward. 
function toggleTermObsidian()
  iterm = hs.appfinder.appFromName("iTerm2")
  obsidian = hs.appfinder.appFromName("Obsidian")
  if iterm:isHidden() then
    iterm:unhide()
    obsidian:hide()
  else 
    obsidian:unhide()
    iterm:hide()
  end
end

-- Weather
function getWeather()
  url = "http://wttr.in/?format=1"
  status, data, headers = hs.http.get(url)
  hs.alert.show(data)
end
--

-- Hotkey Assignments
hs.hotkey.bind(hyper, "L", launchApps)
hs.hotkey.bind(hyper, "P", layoutWindows)
hs.hotkey.bind(hyper, "O", toggleTermObsidian)
hs.hotkey.bind(hyper, "W", getWeather)
