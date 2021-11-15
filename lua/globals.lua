-- CONFIG
_G.colorscheme = "catppuccin"


-- ALIASES
_G.dump = function(...)
	print(vim.inspect(...))
end

-- wrapper for nvim_set_keymap
local keymapper = function(mode, lhs, rhs, override_opts, buffnr)
	-- defaults
	local opts = {noremap = true, silent = true}
	local buf_local = false

	-- if user wants buffer_local mapping use nvim_buf_set_keymap
	if override_opts then
		if override_opts.buffer then
			override_opts.buffer = nil
			buf_local = true
		end
		vim.tbl_extend('keep', override_opts, opts)
	end

	if buf_local then
		vim.api.nvim_buf_set_keymap(buffnr or 0, mode, lhs, rhs, opts)
	else
		vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
	end
end

-- normal
_G.nnoremap = function(lhs, rhs, opts, bufnr)
	keymapper('n', lhs, rhs, opts, bufnr)
end

-- insert
_G.inoremap = function(lhs, rhs, opts, bufnr)
	keymapper('i', lhs, rhs, opts, bufnr)
end

-- visual
_G.vnoremap = function(lhs, rhs, opts, bufnr)
	keymapper('v', lhs, rhs, opts, bufnr)
end

-- command-line
_G.cnoremap = function(lhs, rhs, opts, bufnr)
	keymapper('c', lhs, rhs, opts, bufnr)
end

-- terminal
_G.tnoremap = function(lhs, rhs, opts, bufnr)
	keymapper('t', lhs, rhs, opts, bufnr)
end

-- operator-pending
_G.onoremap = function(lhs, rhs, opts, bufnr)
	keymapper('o', lhs, rhs, opts, bufnr)
end
