defmodule SplatoonBingoWeb.Router do
  use SplatoonBingoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SplatoonBingoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SplatoonBingoWeb do
    pipe_through :browser

    live "/", BingoLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", SplatoonBingoWeb do
  #   pipe_through :api
  # end
end
