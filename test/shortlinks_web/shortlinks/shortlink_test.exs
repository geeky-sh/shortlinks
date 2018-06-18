defmodule ShortlinksWeb.Shortlinks.ShortlinkTest do
  use Shortlinks.DataCase, async: true

  alias Shortlinks.Shortlinks.Genlink

  describe "Shortlink.shortlink_changeset/2 invalid_attr" do
    @invalid_attrs %{}

    changeset = Genlink.changeset(%Genlink{}, @invalid_attrs)

    refute changeset.valid?
  end

  describe "Shortlink.shortlink_changeset/2 invalid_url" do
    @invalid_url %{"actual_url": "google.com"}

    changeset = Genlink.changeset(%Genlink{}, @invalid_url)

    refute changeset.valid?
  end

  describe "Shortlink.shortlink_changeset/2 valid_url" do
    @valid_url %{"actual_url": "http://www.google.com"}

    changeset = Genlink.changeset(%Genlink{}, @valid_url)

    assert changeset.valid?
  end
end
