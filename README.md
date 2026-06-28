# nvim-quick-finder

finder with quickfix for nvim

## Install インストール

Clone (place it in your startup plugins or use `vim.pack.add`).

```
cd ~/.config/nvim/pack/xxx/start/
git clone https://github.com/446r/nvim-quick-finder.git
```

init.lua

```
require("nvim-quick-finder").setup()
```

Customize.

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


## Ex command

覚えやすいの、使いやすいのをsetupで指定してください。

- Qf キーワード 場所 ... QuickFix + finder (default)
- Ff キーワード 場所 ... Fuzzy finder
- Ex キーワード 場所 ... netrw乗っ取り
- Glob キーワード 場所 ... globっぽいもの


