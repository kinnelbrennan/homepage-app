defmodule HomepageAppWeb.Router do
  use HomepageAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug HomepageApp.JwtAuthPlug
  end

  scope "/", HomepageAppWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HomepageAppWeb do
  #   pipe_through :api
  # end
end
