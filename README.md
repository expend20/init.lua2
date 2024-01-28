# Intro

```
:echo stdpath('config')
```

## Cleanup

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
mkdir ~/.config/nvim && cd ~/.config/nvim
```

## Misc

:h rtp -- run time path

netrw
 d -- directory
 % -- create file

:TSPlaygroundToggle -- play with AST provided by treesitter

## Troubleshooting

`Failed to load parser for language 'gitcommit': uv_dlopen:`

Solution: `:TSInstall gitcommit`

## TODO

- explore other fuzzy finders (telescope plugin)
- zenmode
- stage thunks





