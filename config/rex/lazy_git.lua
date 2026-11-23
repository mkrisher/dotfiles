-- Lazygit in a floating pane, in the focused pane's directory.
rex.action({
	name = "lazygit_float",
	title = "Open Lazygit in Floating Pane",
	keywords = "git",
	run = function(ctx, args)
		local _, err = rex.session.new_layer({
			bounds = { 0.05, 0.05, 0.9, 0.9 },
			focus = true,
			layout = rex.layout.block({
				flavor = SHELL,
				options = { command = { "lazygit" }, cwd = focused_pwd(ctx) },
			}),
		})
		if err ~= nil then
			error(err, 0)
		end
	end,
})
rex.bind("ctrl+cmd+g", "lazygit_float")
