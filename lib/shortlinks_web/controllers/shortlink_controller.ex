defmodule ShortlinksWeb.ShortlinkController do
  use ShortlinksWeb, :controller

  alias Shortlinks.Shortlinks.Shortlink

  def generate_shortlink(conn, attrs) do
    case Shortlink.create_shortlink(attrs) do
      {:ok, shortlink} ->
        json(conn, %{"short_url": Shortlink.short_url(shortlink.url_id)})
      {:error, changeset} ->
        conn
        |> put_status(400)
        |> json(Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
          Enum.reduce(opts, msg, fn {key, value}, acc ->
            String.replace(acc, "%{#{key}}", to_string(value))
          end)
        end) |> Poison.encode!)
    end
  end
end
