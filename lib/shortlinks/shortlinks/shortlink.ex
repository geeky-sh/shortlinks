defmodule Shortlinks.Shortlinks.Shortlink do
  use Ecto.Schema
  import Ecto.Changeset

  @url_regex ~r/^https?\:\/\/.*\.*\.*$/

  alias Shortlinks.Repo

  schema "short_links" do
    field :actual_url, :string
    field :url_id, :string

    timestamps()
  end

  @doc false
  def changeset(%Shortlinks.Shortlinks.Shortlink{} = shortlink, attrs) do
    shortlink
    |> cast(attrs, [:actual_url])
    |> change(%{url_id: Map.get(attrs, "actual_url") |> url_id})
    |> validate_required([:url_id, :actual_url])
    |> validate_format(:actual_url, @url_regex)
  end

  def create_shortlink(attrs) do
    %Shortlinks.Shortlinks.Shortlink{}
    |> changeset(attrs)
    |> Repo.insert
  end

  def url_id(nil), do: nil
  def url_id(actual_url) do
    :crypto.hash(:sha512, actual_url)
    |> Base.encode16
    |> to_charlist
    |> Enum.take(8)
    |> to_string
  end

  def short_url(url_id) do
    ShortlinksWeb.Endpoint.url
    |> Path.join(url_id)
  end
end
