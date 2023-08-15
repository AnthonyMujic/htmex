defmodule HTMeX do
  @moduledoc """
  HTMeX simplifies working with the [HTMX](htmx.org) javascript library.
  HTMX can be used to improve the interactivity of you web application without
  having to write much javascript. It can give you site a single page application
  feel while not requiring websockets. It achieves this by using AJAX request to
  the backend and stitches the server response HTML into the DOM.

  Why use this instead of Liveview or deadviews? It is the middle ground. It
  progressively enhances the experience of deadviews, while not requiring a websocket
  connection. If you users have network connectivity issues, it may provide a smother
  experience.

  HTMeX assists by detecting a HTMX ajax request and removing the default layout,
  so only a fragment of HTML is returned by your application, rather than the whole
  page.
  In this way, if the user of your application has javascript disabled on their device,
  they will see you basic application, and each action will cause a full HTML page to be
  sent to them. If they have javascript enabled, HTMeX will detect it and only send back
  the relevant HTML snippet to be stitched into the DOM in the clients browser.
  """

  @doc """
  Add the :htmex plug to your browser pipeline

  ```elixir
  plug :htmex
  ```

  """
  import Plug

  def htmex(conn, _opts) do
    if(htmx_req(Plug.Conn.get_req_header(conn, "hx-request"))) do
      Phoenix.Controller.put_root_layout(conn, html: false)
    else
      conn
    end
  end

  defp htmx_req([]), do: false
  defp htmx_req(["false"]), do: false
  defp htmx_req(["true"]), do: true
end
