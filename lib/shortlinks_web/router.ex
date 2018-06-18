defmodule ShortlinksWeb.Router do
  use ShortlinksWeb, :router

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

  scope "/", ShortlinksWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", ShortlinksWeb do
    pipe_through :api

    post "/gen", ShortlinkController, :generate_shortlink
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShortlinksWeb do
  #   pipe_through :api
  # end
end
