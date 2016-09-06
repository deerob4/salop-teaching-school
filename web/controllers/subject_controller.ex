defmodule TeachingSchool.SubjectController do
  use TeachingSchool.Web, :controller

  @subject_file "priv/static/subjects.txt" 

  def index(conn, _params) do
    subjects = @subject_file |> File.read!
    render(conn, "index.html", subjects: subjects)
  end

  def update(conn, %{"subjects" => %{"subject_list" => subjects}}) do
    subjects = sanitise_string(subjects)
    File.write!(@subject_file, subjects)
    Code.load_file("web/views/teacher_view.ex")

    conn
    |> put_flash(:success, "Subjects successfully updated.")
    |> redirect(to: teacher_path(conn, :index))
  end

  defp sanitise_string(string) do
    string
    |> String.replace("\r", "")
  end
end