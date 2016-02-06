defmodule GithubAPI do
  alias GithubAPI.ResultStream
  alias Org

  def organization_repos(org), do: Org.repos org
  def is_organization_member?(org, user), do: Org.repos org
  def public_members(org), do: Org.public_members org
end
