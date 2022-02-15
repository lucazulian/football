[
  import_deps: [:ecto, :phoenix, :commanded, :commanded_ecto_projections],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  subdirectories: ["priv/*/migrations"],
  locals_without_parens: []
]
