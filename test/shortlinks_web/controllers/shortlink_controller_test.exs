defmodule ShortlinksWeb.ShortlinkControllerTest do
  use ShortlinksWeb.ConnCase

  describe "post/1" do
    test "post with no attributes should return error",  %{conn: conn} do
      conn = post conn, "/api/gen", %{}

      assert json_response(conn, 400)
    end
    test "post with wrong attributes should return error", %{conn: conn} do
      conn = post conn, "/api/gen", %{"actual": "http://google.com"}

      assert json_response(conn, 400)
    end
    test "post with incorrect attributes should return error", %{conn: conn} do
      conn = post conn, "/api/gen", %{"actual_url": "google.com"}

      assert json_response(conn, 400)
    end
    test "post with correct attributes should return success", %{conn: conn} do
      conn = post(conn, "/api/gen", %{"actual_url": "http://www.google.com"})

      assert json_response(conn, 200)
    end
  end
end
