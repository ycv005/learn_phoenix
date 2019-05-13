defmodule LearnPhoenixWeb.ContractController do
    use LearnPhoenixWeb, :controller
    import Ecto.Query
    alias LearnPhoenix.Vendor
    alias LearnPhoenix.Repo

    def new(conn, _params) do
        changeset = Vendor.build_contract()
        render(conn,"add_contract.html",changeset: changeset)
    end

    def create(conn, %{"contract" => contract_new_params}) do
        case Vendor.create_contract(contract_new_params) do
            {:ok, contract} ->
                conn
                |> put_flash(:info, "Contract Added")
                |> redirect(to: "/contracts")
                {:error, changeset} ->
                    conn
                    |> render(:new, changeset: changeset)
        end
    end

    def index(conn, _params) do
        contracts = Vendor.Contract |> order_by(asc: :EndsOn) |> Repo.all
        IO.inspect(contracts)
        render(conn, "show_contract_list.html", contracts: contracts)
    end

end