defmodule TeachingSchool.TeacherView do
  use TeachingSchool.Web, :view
  alias TeachingSchool.Teacher

  def confirm?(_conn, %Teacher{confirmed: true}), do: "Yes"
  def confirm?(conn, %Teacher{confirmed: false} = teacher) do
    params = %{"id" => teacher.id, "teacher" => %{confirmed: true}}

    link "No. Confirm?",
      to: teacher_path(@conn, :update, params),
      method: :post,
      class: "btn btn-primary btn-xs"
  end
end
