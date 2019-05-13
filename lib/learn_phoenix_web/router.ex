defmodule LearnPhoenixWeb.Router do
  use LearnPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug LearnPhoenixWeb.Plugs.LoadCustomer
    # plug LearnPhoenixWeb.Plugs.FetchContract
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LearnPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    get "/contract/new", ContractController, :new
    post "/contract/new", ContractController, :create

    get "/contracts", ContractController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LearnPhoenixWeb do
  #   pipe_through :api
  # end
end
