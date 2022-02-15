# football

A commanded application for testing Commanded stuff

[![CI](https://github.com/lucazulian/football/actions/workflows/ci.yml/badge.svg)](https://github.com/lucazulian/football/actions/workflows/ci.yml)

A simple Event Storming for commanded application example for [todo app](https://miro.com/app/board/uXjVOOQFU3Y=/)


Application created by:

``` elixir
    $ mix phx.new football --live --database postgres 
```

We are almost there! The following steps are missing:

``` elixir
    $ cd football
```

Install dependencies

``` elixir
    $ mix deps.get
```

Then configure your database in config/dev.exs and run:

``` elixir
    $ mix ecto.create
```

Start your Phoenix app with:

``` elixir
    $ mix phx.server
```

You can also run your app inside IEx (Interactive Elixir) as:

``` elixir
    $ iex -S mix phx.server
```


## Development links

  * [Conventional Commits][1]
  * [Elixir Style Guide][2]

  [1]: https://www.conventionalcommits.org/en/v1.0.0/
  [2]: https://github.com/christopheradams/elixir_style_guide
