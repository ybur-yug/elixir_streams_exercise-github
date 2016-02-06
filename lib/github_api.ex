defmodule GithubAPI do
  alias GithubAPI.ResultStream

  @spec repos(string()) :: GithubAPI.ResultStream.t
  def repos(organization), do: ResultStream.new("/orgs/#{organization}/repos")
end
