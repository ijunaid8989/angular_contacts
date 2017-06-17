defmodule Scrapper.Fetch do
  require IEx
  @seaweedfs Application.get_env(:sea_evercam_weed, :seaweedfs_url)
  
  def camera_names(type, attribute) do
    request_from_seaweedfs("#{System.get_env["SEAWEEDFS_URL"]}", type, attribute)
  end

  defp request_from_seaweedfs(url, type, attribute) do
    with {:ok, response} <- HTTPoison.get(url, [], hackney: []),
         %HTTPoison.Response{status_code: 200, body: body} <- response,
         {:ok, data} <- Poison.decode(body),
         true <- is_list(data[type]) do
      Enum.map(data[type], fn(item) -> item[attribute] end)
    else
      _ -> []
    end
  end
end