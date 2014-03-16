# Packex

Relex helper to create an shippable archive file

----

Relex with Pogo is cool. Relex with Pogo and Packex is even cooler.




## Clone

```shell
git clone git@github:asaaki/packex.git packex
```



## Mixfile

Add `Packex` to your dependencies:

```elixir
{ :packex, github: "asaaki/packex.git" }
```

Ensure its `ebin` path is added (on top of `mix.exs`):

```elixir
lc module inlist ~w[ relex pogo packex ] do
  Code.append_path "_build/#{Mix.env}/lib/#{module}/ebin"
end
```

Within the `defmodule Release` definition in your `mix.exs`:

```elixir
  if Code.ensure_loaded?(Relex.Release) do
    defmodule Release do
      use Relex.Release
      Code.ensure_loaded?(Pogo.Release)   && use Pogo.Release
      Code.ensure_loaded?(Packex.Release) && use Packex.Release

      # ... your setup for the release ...
    end
  end
```



## `priv/release.sh`

This file is just a convenient helper script to run the related mix tasks with a single command.



## License

MIT/X11

See: [LICENSE](./LICENSE)
