return {
    "mbbill/undotree",
    keys = {
        {
            '<leader>u',
            "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>",
            desc = "Open undotree",
        },
    },

    config = function()
        vim.g.undotree_WindowLayout = 2
    end
}
