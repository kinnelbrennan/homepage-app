defmodule HomepageAppWeb.PageController do
  use HomepageAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
