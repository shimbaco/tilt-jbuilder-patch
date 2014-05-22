# Tilt::Jbuilder::Patch

A monkey patch for [tilt-jbuilder](https://github.com/anthonator/tilt-jbuilder).

This gem has expected to use on Rails, and patch a file path interpretation.
Using tilt-jbuilder, a code looks like:

```ruby
template = Tilt::JbuilderTemplate.new('app/views/api/posts/index.jbuilder')
```

Using tilt-jbuilder with this gem, a code looks like:

```ruby
template = Tilt::JbuilderTemplate.new('/api/posts/index.jbuilder')
```


## Installation

Add this lines to your application's Gemfile:

    gem 'tilt-jbuilder'
    gem 'tilt-jbuilder-patch'

And then execute:

    $ bundle


## Usage

```ruby
class HomeController < ApplicationController
  def index
    @posts = User.first.posts
    template = Tilt::JbuilderTemplate.new('/api/posts/index.jbuilder')
    scope = Object.new
    scope.instance_variable_set :@posts, @posts
    template.render(scope) # => "{\"posts\":[{\"id\":1,\"title\":\"test1\",\"body\":\"this is a test1.\"..."
  end
end
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/tilt-jbuilder-patch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
