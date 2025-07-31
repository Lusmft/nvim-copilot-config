return {
  -- Навигация по коду
  { 
    "scrooloose/nerdtree",  -- Project and file navigation
    lazy = true,  -- Lazy load the plugin
    cmd = "NERDTreeToggle",  -- Load on command
    keys = {
      { "<F3>", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
      { "<F4>", ":NERDTreeFind<CR>", desc = "Find in NERDTree" },
    },
    config = function()
      --vim.g.NERDTreeShowHidden = 1  -- Show hidden files
      --vim.g.NERDTreeWinSize = 30  -- Set the width of the NERDTree window
      vim.g.NERDTreeIgnore = {
        "\\~$",  -- Ignore backup files
	"\\.pyc$",  -- Ignore Python bytecode files
	"\\.pyo$",  -- Ignore Python optimized files
	"\\.class$",  -- Ignore Java class files
	"pip-log\\.txt$",  -- Ignore pip log files
	"\\.o$",  -- Ignore object files
      }
    end
  },

  -- Работа с кодом
  { 
    "simnalamburt/vim-mundo",  -- Undo tree
    cmd = "MundoToggle",  -- Load on command
    keys = {
      { "<F5>", ":MundoToggle<CR>", desc = "Toggle Undo Tree" },
    },
    config = function()
      vim.opt.undofile = true
      vim.opt.undodir = vim.fn.expand("~/.vim/undo")
    end
  },
  { "Raimondi/delimitMate" },  -- Auto closing of brackets and quotes
  { 
    "nvim-treesitter/nvim-treesitter",  -- Treesitter
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
	  ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "html", "css", "json", "bash" },
	  sync_install = false,
	  auto_install = true,
	  ignore_install = { "javascript" },  -- Ignore JavaScript for now
	  highlight = { 
	    enable = true,
	    disable = { "c", "rust" },  -- Disable for C and Rust
	    additional_vim_regex_highlighting = true,
	  },
	  indent = { enable = true },  
	})
    end
  },

  -- Внешний вид
  { 
    "vim-airline/vim-airline",   -- Status line and tab line
    config = function()
      vim.g.airline_theme = "dark"
      vim.opt.laststatus = 3
      vim.g.airline_powerline_fonts = 1
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
    end
  },
  { "vim-airline/vim-airline-themes" },  -- Themes for vim-airline
  { "ryanoasis/vim-devicons" },  -- Icons for nerdtree

  -- Прочее
  { "mhinz/vim-startify" },  -- Start screen
  { "preservim/nerdcommenter" },  -- Easy commenting
  {
    "gelguy/wilder.nvim",  -- Command line completion
    event = "CmdlineEnter",
    config = function()
      require('wilder').setup({ modes = {':', '/', '?'} })
    end
  },

  -- AI assistance
  { "github/copilot.vim" },  -- GitHub Copilot integration
}
