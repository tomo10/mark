defmodule MarkWeb.Workouts.Index do
  use MarkWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
