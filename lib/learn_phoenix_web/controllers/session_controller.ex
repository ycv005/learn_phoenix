defmodule LearnPhoenixWeb.SessionController do
    use LearnPhoenixWeb, :controller
    alias LearnPhoenix.CRM
    def new(conn, _params) do
        render(conn, "new.html")
    end

    def create(conn, %{"session" => session_params}) do
        case CRM.get_customer_by_credentials(session_params) do
            :error ->
                conn
                |> put_flash(:error, "Invalid username/password")
                |> render("new.html")
            customer ->
                conn
                |> assign(:current_customer, customer)
                |> put_session(:customer_id, customer.id)
                |> configure_session(renew: true)
                |> put_flash(:info, "Login successful")
                |> redirect(to: "/")
        end
    end

    def delete(conn,_) do
        clear_session(conn)
        |> put_flash(:info, "You have been logged out")
        |> redirect(to: "/")
    end
end