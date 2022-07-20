defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  def render("create.json", %{meal: meal}) do
    %{
      message: "Meal created!",
      meals: %{
        meal: meal
      }
    }
  end

  def render("updated.json", %{meal: meal}) do
    %{meal: meal}
  end

  def render("meal.json", %{meal: meal}) do
    %{meal: meal}
  end
end
