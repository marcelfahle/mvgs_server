defmodule MvgsServerWeb.Api.UserController do
  use MvgsServerWeb, :controller

  alias MvgsServer.Accounts

  action_fallback MvgsServerWeb.Api.FallbackController

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        # |> put_flash(:info, "User created successfully.")
        |> put_status(:created)
        |> IO.inspect()
        |> render("show.json", user: user)

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_view(MvgsServerWeb.ErrorView)
        |> render("200.json", %{changeset: changeset})
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  # TODO: let users update profile and delete accounts
  #
  # def update(conn, %{"id" => id, "user" => user_params}) do
  #  user = Accounts.get_user!(id)

  #  case Accounts.update_user(user, user_params) do
  #    {:ok, user} ->
  #      conn
  #      |> put_flash(:info, "User updated successfully.")
  #      |> redirect(to: Routes.user_path(conn, :show, user))

  #    {:error, %Ecto.Changeset{} = changeset} ->
  #      render(conn, "edit.html", user: user, changeset: changeset)
  #  end
  # end

  # def delete(conn, %{"id" => id}) do
  #  user = Accounts.get_user!(id)
  #  {:ok, _user} = Accounts.delete_user(user)

  #  conn
  #  |> put_flash(:info, "User deleted successfully.")
  #  |> redirect(to: Routes.user_path(conn, :index))
  # end
end
