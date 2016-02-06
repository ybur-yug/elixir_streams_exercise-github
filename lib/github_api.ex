defmodule GithubAPI do
  alias GithubAPI.ResultStream

  @doc "GET#index Repositories for a given org"
  @spec repos(String.t) :: GithubAPI.ResultStream.t
  def repos(organization), do: ResultStream.new("/orgs/#{organization}/repos")
end
