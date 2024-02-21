return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	opts = { use_diagnostic_signs = true },
	keys = {
		{ "<leader>df", "<cmd>TroubleToggle document_diagnostics<cr>" },
		{ "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
	},
}
