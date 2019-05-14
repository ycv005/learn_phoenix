defmodule LearnPhoenixWeb.ContractController do
    use LearnPhoenixWeb, :controller
    import Ecto.Query
    alias LearnPhoenix.Vendor
    alias LearnPhoenix.Repo
    alias LearnPhoenix.Vendor.Contract

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
        contracts = Contract |> order_by(asc: :EndsOn) |> Repo.all
        # IO.inspect(contracts)
        render(conn, "show_contract_list.html", contracts: contracts)
    end

    def edit(conn, %{"id" => contract_id}) do
        contract = Repo.get(Contract,contract_id)
        changeset = Contract.changeset(contract)
        IO.inspect(changeset)
        render(conn, "edit_contract.html", contract: contract, changeset: changeset)
    end

    def update(conn, %{"id" => contract_id, "contract" => contract}) do
        # old_contract = Repo.get(Contract, contract_id)
        # changeset = Contract.changeset(old_contract, contract)

        #in 1 line

        changeset = Repo.get(Contract, contract_id) |> Contract.changeset(contract)

        case Repo.update(changeset) do
            {:ok, _topic} ->
                conn
                |> put_flash(:info, "Contract Updated")
                |> redirect(to: Routes.contract_path(conn, :index))
            {:error, changeset} ->
                render conn, "edit.html", changeset: changeset
        end

    end
end