defmodule ZeusWeb.TestView do
  use ZeusWeb, :view
  alias ZeusWeb.TestView

  def render("index.json", %{tests: tests}) do
    %{data: render_many(tests, TestView, "test.json")}
  end

  def render("show.json", %{test: test}) do
    %{data: render_one(test, TestView, "test.json")}
  end

  def render("test.json", %{test: test}) do
    steps = Zeus.Repo.preload(test, :steps).steps
    %{id: test.id,
      name: test.name,
      steps: render_many(steps, ZeusWeb.StepView, "step.json")}
  end
end
