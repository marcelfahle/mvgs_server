defmodule MvgsServerWeb.PageController do
  use MvgsServerWeb, :controller

  def index(conn, _params) do
    user_id = get_session(conn, :user_id)
    render(conn, "index.html", user_id: user_id)
  end
end
