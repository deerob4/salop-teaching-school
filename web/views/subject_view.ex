defmodule TeachingSchool.SubjectView do
  use TeachingSchool.Web, :view

  def subject_count(subjects) when is_bitstring(subjects) do
    subjects
    |> String.split("\n", trim: true)
    |> length
  end
end