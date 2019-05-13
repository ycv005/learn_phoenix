defmodule LearnPhoenix.CRM.Customer do
  use Ecto.Schema
  import Ecto.Changeset
  alias LearnPhoenix.CRM.Customer
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "customers" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_format(:email, ~r/@/,message: "is invalid")
    |> validate_length(:password, min: 8, max: 20)
    |> unique_constraint(:email)
    |> validate_confirmation(:password, message: "Password do not match")
    |> put_hashed_password()
  end

  defp put_hashed_password(changeset) do
    case changeset.valid? do
      true ->
        changes = changeset.changes
        put_change(changeset, :password_hash, hashpwsalt(changes.password))
      _ ->
        changeset
      end
  end

end
