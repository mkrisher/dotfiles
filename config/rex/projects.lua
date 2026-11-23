-- Project layouts (tmuxinator replacement)
--
-- Each project opens a new window (tab) labelled with its name:
--
--   +---------------------+------------+
--   |                     |  bers      |
--   |       editor        +------------+
--   |                     |  tests     |
--   +---------------------+------------+
--
-- Commands are typed into a normal interactive shell, not run as the pane's
-- program. Your shell rc and direnv load first, and stopping the server or
-- tests leaves you at a prompt, the way tmuxinator works.
--
-- Run with:  ctrl+a > p  (picker), the command palette ("Open Project"),
-- or from a shell:  rex do project name=mikekrisher

local HOME = os.getenv("HOME")
local SHELL = "com.superlogical.terminal.shell"

local projects = {
  mikekrisher = {
    root   = HOME .. "/projects/mikekrisher",
    editor = "nvim",
    server = "bers",
    tests  = "bundle exec rspec",
  },
}

-- initial_input is typed as soon as the shell starts, and direnv/devenv
-- loading swallows it. Instead, start an interactive zsh with REX_RUN set;
-- a hook in zshrc types it into the first prompt once direnv has run.
local function pane(cwd, cmd)
  local options = { cwd = cwd }
  if cmd then
    options.shell   = "none"
    options.command = { "/usr/bin/env", "REX_RUN=" .. cmd, "/bin/zsh", "-il" }
  end
  return rex.layout.block{ flavor = SHELL, options = options }
end

local function open_project(name)
  local p = projects[name]
  if p == nil then error("unknown project: " .. tostring(name), 0) end

  -- horizontal = side by side, vertical = stacked. The ratio is the share
  -- given to the first (left/top) layout.
  local layout = rex.layout.horizontal(0.65,
    pane(p.root, p.editor),
    rex.layout.vertical(0.5,
      pane(p.root, p.server),
      pane(p.root, p.tests)))

  local w, err = rex.session.new_window{ layout = layout, window_label = name }
  if err ~= nil then error(err, 0) end

  -- Put the cursor in the editor pane (first block in the layout).
  if w.block_ids and w.block_ids[1] then
    rex.session.focus_block{ block_id = w.block_ids[1] }
  end
  return { window_id = w.window_id }
end

rex.action{
  name     = "project",
  title    = "Open Project",
  category = "Projects",
  keywords = "tmuxinator layout workspace",
  args     = { name = "string?" },
  run      = function(ctx, args)
    local name = args.name
    if name == nil then
      local items = {}
      for key, p in pairs(projects) do
        items[#items + 1] = { id = key, title = key, subtitle = p.root, icon = "folder" }
      end
      table.sort(items, function(a, b) return a.id < b.id end)

      -- rex.ui (prompts) needs Rex API revision 17+. On older builds, open
      -- the only project, or say which names can be passed.
      if rex.ui == nil then
        if #items == 1 then return open_project(items[1].id) end
        local names = {}
        for _, it in ipairs(items) do names[#names + 1] = it.id end
        error("this Rex has no picker; pass name= one of: " .. table.concat(names, ", "), 0)
      end

      local reason
      name, reason = rex.ui.pick{ title = "Open Project", items = items }
      if name == nil then
        if reason == "cancelled" then return end
        error("project picker: " .. tostring(reason), 0)
      end
    end
    return open_project(name)
  end,
}

rex.bind("ctrl+a>p", "project")
