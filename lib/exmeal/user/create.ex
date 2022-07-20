defmodule Exmeal.Users.Create do
  alias Exmeal.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end

  defp handle_insert({:ok, %User{}} = result), do: result
end
