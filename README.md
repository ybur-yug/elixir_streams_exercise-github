# Github API

## Installation
Add `:github_api` to your list of dependencies in `mix.exs`:

```elixir
..
  def deps do
    [{:github_api, "~> 0.0.1"}]
  end
```

Ensure `:github_api` is started before your application:
```elixir
..
  def application do
    [applications: [:github_api]]
  end
..
```

## Use

Fire up IEx and give it a whirl:

```elixir
iex(1)> repo_stream = "nodejs"
|> GithubAPI.repos
|> Stream.map(fn repo_map -> {repo_map["full_name"], repo_map["forks"]} end)
|> Enum.take(4)
# => [{"nodejs/http-parser", 649}, {"nodejs/node-v0.x-archive", 8497},
 {"nodejs/node-gyp", 354}, {"nodejs/readable-stream", 67}]
```

Currently, only repos are supported for listing on the top level API
