defmodule TeachingSchool.TeacherTest do
  use TeachingSchool.ModelCase

  alias TeachingSchool.Teacher

  @valid_attrs %{additional_contact: "some content", email: "some content", family_name: "some content", forename: "some content", school_type: "some content", subject: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Teacher.changeset(%Teacher{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Teacher.changeset(%Teacher{}, @invalid_attrs)
    refute changeset.valid?
  end
end
