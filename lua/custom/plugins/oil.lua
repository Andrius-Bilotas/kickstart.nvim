return {
	"stevearc/oil.nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	lazy = false,
	config = function()
		require('oil').setup({
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-\\>"] = "actions.select_split",
				-- ["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-r>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			use_default_keymaps = false,
			default_file_explorer = true,
			columns = {
				"icon",
			},
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
			win_options = {
				signcolumn = "yes",
			},
		})
	end
}
