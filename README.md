# MWSE mod templates

A set of templates for MWSE mods. It contains two templates:

* `template` - A basic setup useful to any mod. Includes main.lua, together with a config file and basic MCM.
* `templateLocalized` - A basic setup that includes all from the `template` and, in addition, an i18n system using [MWSE's translation system](https://mwse.github.io/MWSE/guides/mod-translations/).

## Usage

Just copy the template you intend to use and rename the folder to you mod's name. Also, you need to rename the require paths accordingly. It's also advised to rename the type definitions in `config\init.lua` to be namespaced with your new mod's name.

```lua
-- It's advised to rename the types in annotations:
---@class template.defaultConfig

-- to:
---@class myModName.defaultConfig

```

## Permissions

Use however you wish.
