local config = {
    ui = {
        default = "float",
        float = {
            border = "none",
            float_hl = "Normal",
            border_hl = "FloatBorder",
            blend = 0,
            height = 0.8,
            width = 0.8,
            x = 0.5,
            y = 0.5
        },
        split = {
            direction = "topleft",
            size = 24
        }
    },
    broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson",
    edit_cmd = "edit",
    on_close = {},
    on_open = {},
    cmds = {
        lf_cmd = "lf",
        fm_cmd = "fm",
        nnn_cmd = "nnn",
        fff_cmd = "fff",
        twf_cmd = "twf",
        fzf_cmd = "fzf",
        fzy_cmd = "find . | fzy",
        xplr_cmd = "xplr",
        vifm_cmd = "vifm",
        skim_cmd = "sk",
        broot_cmd = "broot",
        gitui_cmd = "gitui",
        ranger_cmd = "ranger",
        joshuto_cmd = "joshuto",
        lazygit_cmd = "lazygit",
        neomutt_cmd = "neomutt",
        taskwarrior_cmd = "taskwarrior-tui"
    },
    mappings = {
        vert_split = "<C-v>",
        horz_split = "<C-h>",
        tabedit = "<C-t>",
        edit = "<C-e>",
        ESC = "<ESC>"
    }
}

return config
