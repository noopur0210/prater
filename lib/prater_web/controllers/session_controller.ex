defmodule PraterWeb.SessionController do
  use PraterWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
