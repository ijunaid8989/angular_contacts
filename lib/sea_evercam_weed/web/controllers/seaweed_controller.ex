defmodule SeaEvercamWeed.Web.SeaweedController do
  use SeaEvercamWeed.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
