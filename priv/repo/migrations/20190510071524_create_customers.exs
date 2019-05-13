defmodule LearnPhoenix.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    create table(:customers) do
      add :name, :string
      add :email, :citext
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:customers, [:email])
  end
end
