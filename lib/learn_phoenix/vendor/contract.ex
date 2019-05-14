defmodule LearnPhoenix.Vendor.Contract do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contracts" do
    field :category, :string
    field :cost, :decimal
    field :endson, :date
    field :vendor, :string

    timestamps()
  end

  @doc false
  def changeset(contract, attrs \\ %{}) do
    contract
    |> cast(attrs, [:vendor, :category, :cost, :endson])
    |> validate_required([:vendor, :category, :cost, :endson])
  end
end
