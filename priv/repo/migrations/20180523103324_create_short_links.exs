defmodule Shortlinks.Repo.Migrations.CreateShortLinks do
  use Ecto.Migration

  def change do
    create table(:short_links) do
      add :url_id, :string
      add :actual_url, :string

      timestamps()
    end

  end
end
