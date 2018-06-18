defmodule ShortlinksWeb.PageController do
  use ShortlinksWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
