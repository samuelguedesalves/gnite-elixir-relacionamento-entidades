defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Repo, Meal}

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build(:not_found, "Meal not found")}
      %Meal{} = meal -> {:ok, meal}
    end
  end
end
