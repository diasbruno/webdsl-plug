defmodule WebdslPlugWeb.PageController do
  use WebdslPlugWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
