# Elistix [![Build Status](https://travis-ci.org/lcostantini/elistix.svg?branch=master)](https://travis-ci.org/lcostantini/elistix) [![Inline docs](http://inch-ci.org/github/lcostantini/elistix.svg)](http://inch-ci.org/github/lcostantini/elistix)
An API to talk with ElasticSearch without having to learn a new DSL.

You are only required to learn ElasticSearch from its own documentation and then
you'll be good to go with Elistix.

### Why? ~~personal opinion~~
Having to learn a whole new DSL for an already known and very well documented
service such as ElasticSearch doesn't sound like fun, nor wise.
#### Any actual reason behind this?
Well, let's say you learn an entire new DSL and become a wizard when it comes to
making use of it, then you jump into a project that relies a different one...
and you're pretty much screwed.

Besides, and perhaps even worse, you may be struggling with a query and then you
realize that the problem was actually the library. It could be because they
don't support that specific feature or library owners have just decided to
implement it in a different way from what official documentation says.

Finally, what happens if ElasticSearch version changes? Well, you don't know if
the library will work or support the new version... therefore, you'll be limited
just to supported versions.

*This library is intended to give you total freedom to try/use every aspect of
ElasticSearch by simply copying and pasting the code provided by the
documentation.*

# How does it work?
It just makes use of [HTTPoison](https://github.com/edgurgel/httpoison) to make
requests to the ElasticSearch service and Poison to deal with JSON.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
as:

  1. Add `elistix` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:elistix, "~> 0.1.0"}]
    end
    ```

  2. Ensure `elistix` is started before your application:

    ```elixir
    def application do
      [applications: [:elistix]]
    end
    ```
