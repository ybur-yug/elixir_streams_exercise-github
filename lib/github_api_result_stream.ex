defmodule GithubAPI.ResultStream do
  alias GithubAPI.Gateway

  @spec new(string()) :: Stream.t
  def new(url) do
    Stream.resource(
      fn -> fetch_page(url) end,
      &process_page/1,
      fn _ -> nil end)
  end

  @spec fetch_page(string()) :: tuple()
  defp fetch_page(url) do
    resp      = Gateway.get!(url)
    items     = Poison.decode!(resp.body)
    links_map = resp.headers
                |> List.keyfind("Link", 0, {nil, nil})
                |> elem(1)
                |> parse_links
    {items, links_map["next"]}
  end

  @spec parse_links(nil) :: map()
  def parse_links(nil), do: %{}

  @spec parse_links(string()) :: map()
  def parse_links(links_str) do
    links_str
    |> String.split(links_str, ", ")
    |> Enum.map(fn link ->
        [_,name] = Regex.run(~r{rel="([a-z]+)"}, link)
        [_,url] = Regex.run(~r{<([^>]+)>}, link)
        short_url = String.replace(url, Gateway.endpoint, "")
        {name, short_url}
        end)
     |> Enum.into(%{})
  end

  @spec process_page(tuple()) :: tuple()
  defp process_page({nil, nil}), do: {:halt, nil}
  defp process_page({items, next_page_url}), do: {items, {nil, next_page_url}}
  defp process_page({nil, next_page_url}) do
    next_page_url
    |> fetch_page
    |> process_page
  end
end
