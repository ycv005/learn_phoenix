defmodule LearnPhoenixWeb.ContractController do
    use LearnPhoenixWeb, :controller
    alias LearnPhoenix.Vendor

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
        render(conn, "show_contract_list.html")
    end

end