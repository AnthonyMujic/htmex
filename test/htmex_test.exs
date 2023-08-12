defmodule HTMeXTest do
  use ExUnit.Case
  doctest HTMeX
  import HTMeX

  test "greets the world" do
    conn =
      Plug.Adapters.Test.Conn.conn(%Plug.Conn{}, :get, "/", %{})
      # conn =
      #   Plug.Conn.__struct__()
      |> Phoenix.Controller.put_root_layout(html: {AppView, :root})
      |> htmex("opts")
      |> IO.inspect()

    assert Phoenix.Controller.root_layout(conn) == {AppView, :root}
  end
end
