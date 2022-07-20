defmodule Exmeal.Users.Update do
  alias Exmeal.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User not found")}
      user -> update(user, params)
    end
  end

  defp update(%User{} = user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
