defmodule ExmealWeb.UsersController do
  use ExmealWeb, :controller

  alias ExmealWeb.FallbackController
  alias Exmeal.User

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Exmeal.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", %{user: user})
    end
  end

  def delete(conn, %{"id" => id} = _params) do
    with {:ok, %User{id: ^id}} <- Exmeal.delete_user(id) do
      conn
      |> send_resp(:no_content, "")
    end
  end

  def show(conn, %{"id" => id} = _params) do
    with {:ok, %User{id: ^id} = user} <- Exmeal.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", %{user: user})
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, %User{id: ^id} = user} <- Exmeal.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", %{user: user})
    end
  end
end
