defmodule TeachingSchool.ErrorHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  use Phoenix.HTML

  @doc """
  Generates tag for inlined form input errors.
  """
  def error_tag(form, field) do
    if error = form.errors[field] do
      {message, _} = error
      content_tag :li, build_error(field, message)
    end
  end

  defp build_error(field, message) do
    field =
      field
      |> Atom.to_string
      |> String.replace("_", " ")
      |> String.capitalize

    "#{field} #{message}"
  end
end
