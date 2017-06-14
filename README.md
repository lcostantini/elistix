# Elistix [![Build Status](https://travis-ci.org/lcostantini/elistix.svg?branch=master)](https://travis-ci.org/lcostantini/elistix) [![Inline docs](http://inch-ci.org/github/lcostantini/elistix.svg)](http://inch-ci.org/github/lcostantini/elistix) [![Hex.pm](https://img.shields.io/hexpm/v/elistix.svg?style=plastic)](https://hex.pm/packages/elistix)
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

## Installation

  1. Add `elistix` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:elistix, "~> 1.0.1"}]
    end
    ```

  2. Ensure `elistix` is started before your application:

    ```elixir
    def application do
      [applications: [:elistix]]
    end
    ```

## Configure environment variables
The endpoint for Elasticsearch used by default is
```
"http://127.0.0.1:9200"
```

To change it you have two choices:
  1. You can create a `.env` file and add:

    ```
    export ES_URI="URI VALUE"
    ```

    Then, simply run `source .env` in your shell.

  2. In your Phoenix repository you can set the value in the file `config/{some_env}`
    e.g.: in `config/dev.exs`

    ```
    config :elistix, :es_uri, "URI VALUE"
    ```

# How does it work?
It just makes use of [HTTPoison](https://github.com/edgurgel/httpoison) to make
requests to the ElasticSearch service and Poison to deal with JSON.

Before start using Elistix you need to require it
```
require Elistix
```

Now you can create a new index and load data at the same time with the following
command:
```
Elistix.Index.load_data("examples", "example", '{"name": "trying elistix", "status": "good"}')
```

Then you can run a query over the index
```
query = '{
          "query": {
            "term": {
              "status": {
                "value": "good"
              }
            }
          }
        }'

Elistix.Query.search("examples", "example", query)
```

The response has the format provided by HTTPoison:
```
{ok, response} if everything goes well
{error, reason} if something fail
```

Even you can build the queries with params given by the endpoint
```
query = '{
          "query": {
            "term": {
              "status": {
                "value": "#{params["status"]}"
              }
            }
          }
        }'

Elistix.Query.search("examples", "example", query)

```
