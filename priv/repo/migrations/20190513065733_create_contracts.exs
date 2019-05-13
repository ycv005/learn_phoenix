defmodule LearnPhoenix.Repo.Migrations.CreateContracts do
  use Ecto.Migration

  def change do
    create table(:contracts) do
      add :Vendor, :string
      add :Category, :string
      add :Cost, :decimal
      add :EndsOn, :string

      timestamps()
    end


  end
end
