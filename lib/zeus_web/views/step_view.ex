defmodule ZeusWeb.StepView do
  use ZeusWeb, :view
  alias ZeusWeb.StepView

  def render("index.json", %{steps: steps}) do
    %{data: render_many(steps, StepView, "step.json")}
  end

  def render("show.json", %{step: step}) do
    %{data: render_one(step, StepView, "step.json")}
  end

  def render("step.json", %{step: step}) do
    %{id: step.id,
      template_id: step.template_id,
      params: step.params}
  end
end
