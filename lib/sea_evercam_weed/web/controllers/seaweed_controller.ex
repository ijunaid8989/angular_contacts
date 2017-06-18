defmodule SeaEvercamWeed.Web.SeaweedController do
  use SeaEvercamWeed.Web, :controller

  def index(conn, _params) do
    listing_camera_names = Scrapper.Fetch.camera_names("Subdirectories", "Name")
    render(conn, "index.html", listing_camera_names: listing_camera_names)
  end
end
