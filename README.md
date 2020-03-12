# Genesis

A foundational model for building your own personal
[PIM](https://en.wikipedia.org/wiki/Product_information_management).

## Requirements

  * Ruby 2.7
  * Postgres 11

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'genesis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install genesis

## Getting Started

A Postgres database is required for usage so you'll need to set that up first.

```sh
rake database:setup[env]
# Be sure to replace 'env' with 'development', 'test', or 'production'
```

**Note**: This is a destructive action! If you have an existing database already
setup, this will drop it first.

## Usage

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can
also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/bluebottlecoffee/genesis.

### TODO

#### Initial Release

Handle `ItemDefinition`s and `Item`s without worrying about what an `Item` is
composed of.

- `ItemDefinition`
- `Item`
- `InventoryItem`
- `ComposedItem`
- `OnDemandComposedItem`

#### Later Release

Handle the `BillOfMaterials` on `ComposedItem` and `OnDemandComposedItem`.
This allows us to store the 'recipe' of an `Item` for the purpose of material
costs.

- `BillOfMaterials`
