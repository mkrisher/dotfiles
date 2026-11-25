-- tmux (prefix ctrl+a)
rex.bind("ctrl+a>ctrl+a", "pane.send_key", { key = "ctrl+a" })

rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+a>alt+r", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/enter", "client.mode.exit")
rex.bind("repeat/escape", "client.mode.exit")

rex.bind("ctrl+a>ctrl+e", "client.tab.new")
rex.bind("ctrl+a>ctrl+r", "client.config.reload")
rex.bind("ctrl+a>c", "client.tab.new")
rex.bind("ctrl+a>shift+r", "session.rename")
rex.bind("ctrl+a>ctrl+[", "client.tab.previous")
rex.bind("repeat/ctrl+[", "client.tab.previous")
rex.bind("ctrl+a>ctrl+]", "client.tab.next")
rex.bind("repeat/ctrl+]", "client.tab.next")
rex.bind("ctrl+a>shift+x", "client.tab.close")
rex.bind("ctrl+a>shift+\\", "pane.split", { direction = "right" })
rex.bind("ctrl+a>shift+-", "pane.split", { direction = "down" })
rex.bind("ctrl+a>ctrl+o", "pane.move", { direction = "down" })
rex.bind("repeat/ctrl+o", "pane.move", { direction = "down" })
rex.bind("ctrl+a>shift+=", "pane.zoom")
rex.bind("ctrl+a>u", "pane.resize", { amount = 10, direction = "up" })
rex.bind("ctrl+a>d", "pane.resize", { amount = 10, direction = "down" })
rex.bind("ctrl+a>l", "pane.resize", { amount = 10, direction = "left" })
rex.bind("ctrl+a>r", "pane.resize", { amount = 13, direction = "right" })
rex.bind("ctrl+a>x", "pane.close")

-- iTerm2 (Default profile keyboard map)
rex.bind("ctrl+-", "pane.send_key", { key = "ctrl+shift+-" })
rex.bind("ctrl+2", "pane.send_key", { key = "ctrl+shift+2" })
rex.bind("ctrl+3", "pane.send_key", { key = "esc" })
rex.bind("ctrl+4", "pane.send_key", { key = "ctrl+\\" })
rex.bind("ctrl+5", "pane.send_key", { key = "ctrl+]" })
rex.bind("ctrl+6", "pane.send_key", { key = "ctrl+shift+6" })
rex.bind("ctrl+7", "pane.send_key", { key = "ctrl+shift+-" })
rex.bind("ctrl+8", "pane.send_key", { key = "backspace" })

-- Project layouts (tmuxinator replacement)
require("projects")

-- lazygit in floating window
require("lazy_git")

-- >>> resh >>>
dofile("/Users/mkrisher/Library/Application Support/resh/resh.lua")
rex.exec.start({ "/Users/mkrisher/Library/Application Support/resh/resh", "service", "start" },
  { detach = true, stdout = false, stderr = false })
-- <<< resh <<<
