defmodule ZeusWeb.Router do
  use ZeusWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ZeusWeb do
    scope "/v1" do
      pipe_through :api

      resources "/templates", TemplateController, only: [:index]
    end
  end
end