defmodule LearnPhoenix.Vendor.Contract do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contracts" do
    field :Category, :string
    field :Cost, :decimal
    field :EndsOn, :date
    field :Vendor, :string

    timestamps()
  end

  @doc false
  def changeset(contract, attrs \\ %{}) do
    contract
    |> cast(attrs, [:Vendor, :Category, :Cost, :EndsOn])
    |> validate_required([:Vendor, :Category, :Cost, :EndsOn])
  end
end
