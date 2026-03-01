# 👽 neovim config

Config minimalista de Neovim para desarrollo web. Gestionado con **lazy.nvim**.

---

## 🛸 estructura

```
~/.config/nvim/
├── init.lua
└── lua/
    ├── vim-options.lua
    └── plugins/
```

---

## 🌌 plugins

### editor
| plugin | descripción |
|--------|-------------|
| 🛸 `nvim-treesitter` | syntax highlighting y indentación inteligente |
| 👾 `nvim-autopairs` | cierre automático de paréntesis y brackets |
| 🤖 `Comment.nvim` | comentar líneas con `gcc` / `gc` |
| 🌠 `indent-blankline` | guías visuales de indentación |
| 👽 `leap.nvim` | navegación rápida por el buffer con `s` / `S` |

### lsp & diagnósticos
| plugin | descripción |
|--------|-------------|
| 🛸 `mason.nvim` | gestor de LSP servers, linters y formatters |
| 🤖 `mason-lspconfig` | instalación automática de servers |
| 👾 `nvim-lspconfig` | configuración de LSP (ts, eslint, lua, html, css) |
| 🌌 `tiny-inline-diagnostic` | errores inline al estilo Error Lens |

### git
| plugin | descripción |
|--------|-------------|
| 🛸 `gitsigns.nvim` | hunks, blame y signs en el gutter |
| 👽 `lazygit.nvim` | UI de git desde neovim |
| 🌠 `diffview.nvim` | diff y file history visual |

### ui
| plugin | descripción |
|--------|-------------|
| 🌌 `onedarkpro.nvim` | colorscheme `onedark_dark` con transparencia |
| 🛸 `lualine.nvim` | statusline con tema dracula |
| 👾 `neo-tree.nvim` | explorador de archivos lateral |
| 👽 `dashboard-nvim` | pantalla de inicio |

---

## 🌠 keymaps principales

| tecla | acción |
|-------|--------|
| `<Space>` | leader |
| `jj` | salir de insert mode |
| `<leader>f` | explorador de archivos |
| `<leader>p` | buscar archivos (telescope) |
| `<leader>ff` | buscar texto (live grep) |
| `<leader>b` | listar buffers |
| `<leader>lg` | lazygit |
| `<leader>dv` | diffview open |
| `s` / `S` | leap forward / backward |
| `gd` | ir a definición (LSP) |
| `K` | hover docs (LSP) |
| `<leader>ca` | code action |
| `<leader>rn` | rename |
| `<C-j/k>` | mover línea arriba/abajo |

---

## 🚀 instalación

```bash
git clone https://github.com/tu-usuario/nvim-config ~/.config/nvim
nvim  # lazy.nvim instala todo automáticamente
```
