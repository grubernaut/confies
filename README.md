# confies-cookbook

Personal Cookbook to install all of my dotfiles and configs

Testing can be done in test-kitchen, withc the kitchen-docker driver

Expectations:
- Chef pre-installed
- Users pre-created
- That this may not work for you
  - Implying, variables are hardcoded as of now. May change in the future
  
## Supported Platforms

Archlinux - Rolling

## Attributes

<none currently>

## Usage

To make things instantly awesome

### confies::default

Include `confies` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[confies::default]"
  ]
}
```

## License and Authors

Author:: Jake Champlin (<jake.champlin.27@gmail.com>)
