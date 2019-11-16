defmodule MvgsServerWeb.Api.UserView do
  use MvgsServerWeb, :view

  def render("show.json", %{user: user}) do
    %{data: render_one(user, __MODULE__, "user.json", as: :user)}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username}
  end
end
