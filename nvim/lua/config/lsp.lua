local server = {
    "gopls",
}

local function on_attach(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client == nil then
        vim.notify_once("couldn't find lsp")
        return
    end

    local bufnr = args.buffer

    local function opt(desc)
        return { desc = desc, buffer = bufnr }
    end

    local map = vim.keymap.set
    local telescope = require("telescope.builtin")

    --- Toggle Virtual lines

    if client:supports_method "textDocument/completion" then
        vim.bo.completeopt = "menu,menuone,noselect,fuzzy"
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    if client:supports_method "textDocument/formatting" then
        map("n", "grF", function() vim.lsp.buf.format({ async = false }) end, opt("Format buffer"))
    end

    if client:supports_method "textDocument/documentSymbol" then
        map("n", "gO", telescope.lsp_document_symbols, opt("List document symbols"))
    end

    if client:supports_method "workspace/workspaceSymbols" then
        map("n", "grO", telescope.lsp_workspace_symbols, opt("List workspace symbols"))
    end

    if client:supports_method "textDocument/inlayHint" then
        map("n", "griH", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, opt("Toggle inlay hints"))
    end

	if client:supports_method "textDocument/definition" then
		map("n", "gd", telescope.lsp_definitions, opt("List definitions"))
	end
end

local function init()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = on_attach,
    })

    vim.lsp.enable(server)
end

init()
