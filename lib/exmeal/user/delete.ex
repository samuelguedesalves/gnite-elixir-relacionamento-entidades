defmodule Exmeal.Users.Delete do
  alias Exmeal.{Error, Repo, User}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User not found")}
      %User{} = user -> Repo.delete(user)
    end
  end
end
