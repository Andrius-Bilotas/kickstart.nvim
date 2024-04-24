return {
	"sbdchd/neoformat",
	lazy = false,
	priority = 1000,
	config = function()
		local fmt_group = vim.api.nvim_create_augroup("fmt", { clear = true })

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = fmt_group,
			pattern = "*",
			callback = function()
				-- Specify the maximum file size (in kilobytes)
				local max_size_kb = 128 -- 128 KB

				-- Get the size of the current file
				local file_size_kb = vim.fn.getfsize(vim.fn.expand('%:p')) / 1024

				-- Check if the file size is within the limit
				if file_size_kb < max_size_kb then
					-- Run Neoformat if the file is smaller than the limit
					vim.cmd("undojoin | Neoformat")
				end
			end
		})
	end
}
