# is-fast.nvim

A Neovim plugin that executes selected text through the [`is-fast`](https://github.com/Magic-JD/is-fast) CLI tool and displays results in a new buffer.
Requires installation of the is-fast tool.

---

## Features  
- Run visual selections through `is-fast` directly from Neovim  
- Supports both standard and `--direct` modes  
- Configurable keybindings  
- Handles single/multi-line text selections  
- Results displayed in vertical split  

---

## Installation  

Install `is-fast` latest version [here](https://github.com/Magic-JD/is-fast)
Add the plugin to your configuration.

### Lazy.nvim  
```lua  
{  
  'your-username/is-fast.nvim',  
  opts = {}  
}  
```

### Packer.nvim  
```lua  
use {  
  'your-username/is-fast.nvim',  
  config = function()  
    require('is-fast').setup()  
  end  
}  
```

---

## Configuration  

```lua  
require('is-fast').setup({  
  keymap_normal = "<leader>sq",  # Default: Run as a query 
  keymap_direct = "<leader>sd"  # Default: Find the selected url directly 
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
   - `<leader>sq` - Standard mode - use this for making a Search Query about the selected text. 
   - `<leader>sd` - Direct mode (`--direct` flag) - use this for searching a url directly.
3. Results appear in new vertical split - note this may take a little time. 

---

## Troubleshooting  

**Command Not Found**  
```bash  
which is-fast  
```

---
