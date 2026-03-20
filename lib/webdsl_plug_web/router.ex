defmodule WebdslPlugWeb.Router do
  use WebdslPlugWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {WebdslPlugWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WebdslPlugWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  if Application.compile_env(:webdsl_plug, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: WebdslPlugWeb.Telemetry
    end
  end
end
