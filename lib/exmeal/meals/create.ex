defmodule Exmeal.Meals.Create do
  alias Exmeal.{Error, Repo, Meal}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result
end
