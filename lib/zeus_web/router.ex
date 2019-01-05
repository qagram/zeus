defmodule ZeusWeb.Router do
  use ZeusWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ZeusWeb do
    scope "/v1" do
      pipe_through :api

      resources "/templates", TemplateController, only: [:index]
      resources "/steps", StepController, except: [:new, :edit]
      resources "/tests", TestController, except: [:new, :edit]

      get "/run", TestController, :run
    end
  end
end
