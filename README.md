# nvim-quick-finder

finder with quickfix for nvim

## Install インストール

clone

```
cd ~/.config/nvim/lua/
git clone https://github.com/446r/nvim-quick-finder.git
```

init.lua

```
require("nvim-quick-finder").setup()
```

customize

```
require("nvim-quick-finder").setup({
  ignore = { ".git", "node_modules" },
  command = "Ex",
})
```

## Usage 使い方

```
:Qf keyword target_dir
```

-> nvim opens QuickFix with list of files.



