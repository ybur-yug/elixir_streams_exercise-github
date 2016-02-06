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
iex(1)> organization_repos = GithubAPI.organization_repos("cometaworks")
iex(2)> do_i_work_at_cometa = GithubAPIis_organization_member?("cometaworks", "ybur-yug")
iex(3)> cometa_people = GithupAPI.public_members "cometaworks"
```

Currently, only repos are supported for listing on the top level API
