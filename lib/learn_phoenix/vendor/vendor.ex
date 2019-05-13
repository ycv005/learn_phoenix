defmodule LearnPhoenix.Vendor do
    alias LearnPhoenix.Repo
    alias LearnPhoenix.Vendor.Contract
    import Plug.Conn

    def build_contract(attrs \\ %{}) do
        %Contract{}
        |> Contract.changeset(attrs)
    end

    def create_contract(attrs) do
        attrs
        |> build_contract
        |> Repo.insert
    end
end