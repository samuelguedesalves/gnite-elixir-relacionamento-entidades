defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias ExmealWeb.FallbackController
  alias Exmeal.Meal

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", %{meal: meal})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Exmeal.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", %{meal: meal})
    end
  end

  def delete(conn, %{"id" => id} = _params) do
    with {:ok, _meal} <- Exmeal.delete_meal(id) do
      conn
      |> send_resp(:no_content, "")
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("updated.json", %{meal: meal})
    end
  end
end
