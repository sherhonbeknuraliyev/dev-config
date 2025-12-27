-- Buffer line
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local colors = {
      bg = "#1a1b26",
      fg = "#a9b1d6",
      yellow = "#e0af68",
      green = "#9ece6a",
      red = "#f7768e",
      blue = "#7aa2f7",
    }

    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        indicator = {
          style = "icon",
          icon = "▎",
        },
        modified_icon = "●",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true,
          },
        },
      },
      highlights = {
        modified = { fg = colors.yellow },
        modified_visible = { fg = colors.yellow },
        modified_selected = { fg = colors.yellow, bold = true },
        buffer_selected = { fg = colors.fg, bold = true, italic = false },
        indicator_selected = { fg = colors.blue },
        separator = { fg = colors.bg },
        separator_selected = { fg = colors.bg },
        separator_visible = { fg = colors.bg },
      },
    })
  end,
}
