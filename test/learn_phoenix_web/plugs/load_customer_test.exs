defmodule LearnPhoenixWeb.Plugs.LoadCustomerTest do
    use LearnPhoenixWeb.ConnCase
    alias LearnPhoenix.CRM
    @valid_attrs %{
    "name" => "John",
    "email" => "john@example.com",
    "password" => "secret01",
    "password_confirmation" => "secret01"
    }
    test "fetch customer from session on subsequent visit" do
    # Create a new customer
    {:ok, customer} = CRM.create_customer(@valid_attrs)
    # Build a new conn by posting login data to "/session" path
    conn = post build_conn(), "/login", %{"session" =>
    @valid_attrs }
    conn = get conn, "/"
    assert customer.id == conn.assigns.current_customer.id
    end
end