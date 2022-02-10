# football

A commanded application for testing Commanded stuff

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
