defmodule MvgsServerWeb.Router do
  use MvgsServerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MvgsServerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/login", SessionController, :new
    get "/logout", SessionController, :delete

    resources "/rooms", RoomController
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", MvgsServerWeb.Api, as: :api do
    pipe_through :api
    resources "/users", UserController, only: [:create, :show]
  end
end
