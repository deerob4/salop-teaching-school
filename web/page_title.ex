defmodule TeachingSchool.PageTitle do
  @moduledoc """
  Creates page titles for each individual view,
  appending the correct suffix to the end.
  """
  alias TeachingSchool.{TeacherView}

  @suffix "Shropshire Teaching Alliance"

  def page_title(assigns) do
    IO.inspect assigns.view_module

    assigns
    |> get_title
    |> put_suffix
  end

  defp put_suffix(nil), do: @suffix
  defp put_suffix(title), do: title <> " - " <> @suffix

  defp get_title(%{view_module: TeacherView, view_template: "new.html"}) do
    "Add a Teacher"
  end
  defp get_title(%{view_module: TeacherView, view_template: "index.html"}) do
    "Teachers"
  end
  defp get_title(_), do: nil
end