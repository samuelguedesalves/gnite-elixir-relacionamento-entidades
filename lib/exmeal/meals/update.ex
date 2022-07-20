defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Repo, Meal}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build(:not_found, "Meal not found")}
      meal -> update(meal, params)
    end
  end

  defp update(%Meal{} = meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
