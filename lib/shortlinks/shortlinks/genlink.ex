defmodule Shortlinks.Shortlinks.Genlink do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :actual_url
  end

  @url_regex ~r/^https?\:\/\/.*\.*\.*$/

  def changeset(genlink, attrs) do
    genlink
    |> cast(attrs, [:actual_url])
    |> validate_required([:actual_url])
    |> validate_format(:actual_url, @url_regex)
  end
end
