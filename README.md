# is-fast.nvim

A Neovim plugin that executes selected text through the [`is-fast`](https://github.com/Magic-JD/is-fast) CLI tool and displays results in a new buffer.

---

## Features  
- Run visual selections through `is-fast` directly from Neovim  
- Supports both standard and `--direct` modes  
- Configurable keybindings  
- Handles single/multi-line text selections  
- Results displayed in vertical split  

---

## Installation  

### Packer.nvim  
```lua  
use {  
  'your-username/is-fast.nvim',  
  config = function()  
    require('is-fast').setup()  
  end  
}  
```

### Lazy.nvim  
```lua  
{  
  'your-username/is-fast.nvim',  
  opts = {}  
}  
```

---

## Configuration  

```lua  
require('is-fast').setup({  
  keymap_normal = "<leader>sq",  # Default: Run without --direct  
  keymap_direct = "<leader>sd"  # Default: Run with --direct flag  
})  
```

| Option | Default | Description |  
|--------|---------|-------------|  
| `keymap_normal` | `<leader>sq` | Visual mode mapping for standard query execution |  
| `keymap_direct` | `<leader>sd` | Visual mode mapping for direct mode |  

---

## Usage  

1. Select text in visual mode (`v`, `V`, or `<C-v>`)  
2. Execute command:  
   - `<leader>sq` - Standard mode  
   - `<leader>sd` - Direct mode (`--direct` flag)  
3. Results appear in new vertical split  

---

## Troubleshooting  

**Command Not Found**  
```bash  
which is-fast  
```

---
