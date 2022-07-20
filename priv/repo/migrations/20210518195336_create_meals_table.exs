defmodule Exmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table("meals") do
      add :calories, :integer, null: false
      add :description, :string, null: false
      add :date, :date, null: false
      add :user_id, references("users"), null: false
    end
  end
end
