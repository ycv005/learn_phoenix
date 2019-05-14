defmodule LearnPhoenix.Repo.Migrations.CreateContracts do
  use Ecto.Migration

  def change do
    create table(:contracts) do
      add :vendor, :string
      add :category, :string
      add :cost, :decimal
      add :endson, :date

      timestamps()
    end
  end
end
