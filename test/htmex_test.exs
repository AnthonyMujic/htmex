defmodule HTMeXTest do
  use ExUnit.Case
  doctest HTMeX
  import HTMeX

  test "hx-request in the header removes root layout" do
    conn =
      Plug.Adapters.Test.Conn.conn(%Plug.Conn{}, :get, "/", %{})
      |> Phoenix.Controller.put_root_layout(html: {AppView, :root})
      |> htmex("opts")

    assert Phoenix.Controller.root_layout(conn, "html") == {AppView, :root}

    conn =
      conn
      |> Plug.Conn.put_req_header("hx-request", "true")
      |> htmex("opts")

    assert Phoenix.Controller.root_layout(conn, "html") == false
  end
end
