defmodule GithubAPI do
  alias GithubAPI.ResultStream

  @spec repos(String.t) :: GithubAPI.ResultStream.t
  def repos(organization), do: ResultStream.new("/orgs/#{organization}/repos")
end
