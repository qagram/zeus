defmodule ZeusWeb.TemplateView do
  use ZeusWeb, :view
  alias ZeusWeb.TemplateView

  def render("index.json", %{template: template}) do
    %{data: render_many(template, TemplateView, "template.json")}
  end

  def render("show.json", %{template: template}) do
    %{data: render_one(template, TemplateView, "template.json")}
  end

  def render("template.json", %{template: template}) do
    %{id: template.id,
      label: template.label}
  end
end
