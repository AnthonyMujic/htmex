# HTMeX

**When you want your dead views to keep kicking using the power of HTMX**

HTMeX simplifies working with the [HTMX](https://htmx.org/) javascript library.
HTMX can be used to improve the interactivity of you web application without
having to write much javascript. It can give your site a single page application
feel while not requiring websockets. It achieves this by using AJAX request to
the backend and stitches the server response HTML into the DOM.

Why use this instead of LiveView or dead views? It is the middle ground. It
progressively enhances the experience of dead views, while not requiring a websocket
connection. If you users have network connectivity issues, it may provide a smoother
experience.

HTMeX assists by detecting a HTMX ajax request and removing the root layout,
so only a fragment of HTML is returned by your application, rather than the whole
page.

In this way, if the user of your application has javascript disabled on their device,
they will see your basic application, and each action will cause a full HTML page to be
sent. If they have javascript enabled, HTMeX will detect it and only send back
the relevant HTML snippet to be stitched into the DOM in the clients browser.

## Getting started

1. Add HTMeX to `mix.exs`:

```elixir
  defmodule MyApp.MixProject do
    # ...

    defp deps do
      [
        # ...
        {:htmex, "~> 0.1"}
      ]
    end
  end
  ```

2. Pull down the HTMeX:

```
mix deps.get
```

3. Add HTMX to your root layout (or download it and serve it as an asset) and add the `hx-boost` attribute to the body tag `my_app/lib/my_app_list_web/components/layouts/root.html.heex`:

```html
<!DOCTYPE html>
<html lang="en" style="scrollbar-gutter: stable;">
  <head>
  # ...
    <script
        src="https://unpkg.com/htmx.org@1.9.4"
        integrity="sha384-zUfuhFKKZCbHTY6aRR46gxiqszMk5tcHjsVFxnUo8VMus4kHGVdIYVbOYYNlKmHV"
        crossorigin="anonymous"
      >
  # ...
  </head>
  <body hx-boost="true" class="bg-white antialiased">
  # ...
```
4. Add the `:htmex` plug to your browser pipeline in `router.ex`:

```elixir
  defmodule MyAppWeb.Router do
    use MyAppWeb, :router

    import HTMeX

    pipeline :browser do
      # ...
      plug :htmex
    end
    # ...
```

