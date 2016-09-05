defmodule TeachingSchool.TeacherController do
  use TeachingSchool.Web, :controller
  alias TeachingSchool.Teacher

  def index(conn, _params) do
    teachers = Repo.all(Teacher)
    render(conn, "index.html", teachers: teachers)
  end

  def new(conn, _params) do
    changeset = Teacher.changeset(%Teacher{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"teacher" => teacher_params}) do
    changeset = Teacher.changeset(%Teacher{}, teacher_params)

    case Repo.insert(changeset) do
      {:ok, _teacher} ->
        conn
        |> put_flash(:info, "Teacher created successfully.")
        |> redirect(to: teacher_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "teacher" => teacher_params}) do
    teacher = Repo.get(Teacher, id)
    changeset = Teacher.changeset(teacher, teacher_params)

    case Repo.update(changeset) do
      {:ok, teacher} ->
        conn
        |> put_flash(:success, "Teacher successfully updated.")
        |> redirect(to: teacher_path(conn, :index))
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Error updating teacher.")
        |> redirect(to: teacher_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => id}) do
    teacher = Repo.get!(Teacher, id)

    Repo.delete!(teacher)

    conn
    |> put_flash(:info, "Teacher deleted successfully.")
    |> redirect(to: teacher_path(conn, :index))
  end
end
