defmodule Exmeal.Users.Get do
  alias Exmeal.{Error, Repo, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User not found")}
      %User{} = user -> {:ok, user}
    end
  end
end
