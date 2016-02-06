defmodule GithubAPI.Org do
  @doc "GET#index Repositories for a given org"
  @spec repos(String.t) :: GithubAPI.ResultStream.t
  def repos(org), do: ResultStream.new("/orgs/#{org}/repos")

  @doc "Determine if a user is a member of an org"
  @spec is_member?(String.t, String.t) :: GithubAPI.ResultStream.t
  def is_member?(user, org), do: ResultStream.new("/orgs/#{org}/members/#{user}")

  @doc "List public members of an org"
  @spec public_members(String.t) :: GithubAPI.ResultStream.t
  def public_members(org), do: ResultStream.new("/orgs/#{org}/public_members")
end
