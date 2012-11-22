# mongoid-flags [![Build Status](https://secure.travis-ci.org/tjackiw/mongoid-flags.png)](https://travis-ci.org/tjackiw/mongoid-flags)

Simple document flagging system for mongoid v3. HEAVILY INSPIRED by mongoid-simple-roles

## Install

Add this line to your Gemfile:

```ruby
gem 'mongoid-flags'
```

And then execute:

```ruby
bundle install
```

Or install it yourself:

```ruby
gem install mongoid-flags
```

## Usage

### Model

```ruby
class User
  include Mongoid::Document
  include Mongoid::Document::Flagable
  
  field :name, type: String
end
```

### Instance Methods

Let's first create an instance of the User model

```ruby
user = User.create(name: 'John Doe')
```

`add_flag(flag)` will add a flag to the instance. You need to explicitly call `.save` to persist the changes.

```ruby
user.add_flag('suspended')
=> ["suspended"]
user.reload
user.has_flag?('suspended')
=> false
```

`add_flag!(flag)` is same as `add_flag` but it automatically saves the instance.

```ruby
user.add_flag!('suspended')
=> ["suspended"]
user.reload
user.has_flag?('suspended')
=> true
```

`has_flag?(flag)` checks if a flag exist and returns `true` or `false`.

```ruby
user.add_flag!('suspended')
=> ["suspended"]
user.has_flag?('suspended')
=> true
user.has_flag?('underage')
=> false
```

`remove_flag(flag)` removes a flag. You need to explicitly call `.save` to persist the changes.

```ruby
user.remove_flag('suspended')
=> []
user.reload
user.has_flag?('suspended')
=> true
```

`remove_flag!(flag)` same as `remove_flag` but it automatically saves the instance.

```ruby
user.remove_flag!('suspended')
=> []
user.reload
user.has_flag?('suspended')
=> false
```

### Class Methods

`find_by_flags(flags)` performs a query based on the flags provided and returns an array of objects (if any). The argument can either be a String or an Array.

```ruby
User.find_by_flags('suspended')
=> [<User>]

User.find_by_flags(['suspended', 'underage'])
=> [<User>]
```

## Contributing to mongoid-flags
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history.

## Authors

* Thiago Jackiw: [@tjackiw](http://twitter.com/tjackiw)

## Copyright

Copyright (c) 2012 Thiago Jackiw. See LICENSE.txt for further details.
