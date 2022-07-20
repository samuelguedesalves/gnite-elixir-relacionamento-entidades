defmodule ExmealWeb.UsersView do
  use ExmealWeb, :view

  def render("create.json", %{user: user}) do
    %{
      user: %{
        user: user
      },
      message: "User created!"
    }
  end

  def render("user.json", %{user: user}) do
    %{user: user}
  end
end
