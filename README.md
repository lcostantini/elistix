# Elistix
This is an API to talk with ElasticSearch without learn any new DSL.

You only need to worry about learn ElasticSearch from its own documentation and
then use it with Elistix without changing anything.

### Why? ~~personal opinion~~
I don't like the idea to learn a new DSL that people want to create for a very
known and very good documented service as ElasticSearch it's. **Why?**.
Because you can learn an entire DSL and be the wizard of that library, then
you go to another project and use another library so you're screwed. Even worse
you can be fighting with a query to the moment you realize that the problem was
the library, because they don't support some option or they decide do in a
different way as the official documentation explains. Also, what happens if the
ElasticSearch version change? you don't know if the library will works or give
support to the new version therefore you will be bound to it.

*This library gives you the entire freedom to try/use every aspect of ElasticSearch
just copying and paste the code as the documentation shows.*

# How it works?
This only use [HTTPoison](https://github.com/edgurgel/httpoison) to make the
requests to the ElasticSearch URL.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

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
