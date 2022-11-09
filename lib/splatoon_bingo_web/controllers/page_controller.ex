defmodule SplatoonBingoWeb.PageController do
  use SplatoonBingoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
