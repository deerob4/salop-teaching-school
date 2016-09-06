defmodule TeachingSchool.TeacherView do
  use TeachingSchool.Web, :view
  alias TeachingSchool.Teacher

  @subject_file "priv/static/subjects.txt"
  @subjects []

  @subject_file
  |> File.read!
  |> String.split("\n", trim: true)
  |> Enum.each(&(@subjects @subjects ++ [&1]))

  @doc """
  A list of available subjects.
  """
  def subjects do
    @subjects
    |> Enum.sort
    |> create_options
  end

  def format_subject(nil), do: nil
  def format_subject(subject) when is_bitstring(subject) do
    subject
    |> String.replace("_", " ")
    |> title_case
  end

  defp title_case(string) do
    string
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  @doc """
  A list of available school types.
  """
  def school_types do
    ["Primary", "Secondary", "Either"] |> create_options
  end

  @doc """
  Builds a list of two-item tuples, the first being
  the original `option`, the second being that option
  formatted for a database.
  """
  def create_options(options) when is_list(options) do
    Enum.map(options, &({&1, String.downcase(&1)}))
  end

  @doc """
  Returns a string if `teacher` is confirmed, otherwise
  a link to the confirm route.
  """
  def confirm?(_conn, %Teacher{confirmed: true}), do: "Yes"
  def confirm?(conn, %Teacher{confirmed: false} = teacher) do
    params = %{"id" => teacher.id, "teacher" => %{confirmed: true}}

    button "Confirm",
      to: teacher_path(conn, :update, params),
      method: :post,
      class: "mini basic green ui button"
  end
end
