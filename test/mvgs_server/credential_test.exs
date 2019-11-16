defmodule MvgsServer.CredentialText do
  
  use MvgsServer.DataCase

  alias MvgsServer.Accounts.Credential

  @valid_attrs %{email: "test@test.com", 
    password: "jkljkljkl", 
    password_confirmation: "jkljkljkl"}

  test "changeset with valid attributes" do
    changeset = Credential.registration_changeset(%Credential{}, @valid_attrs)
    assert changeset.changes.password_hash
    assert changeset.valid?
  end

  test "email, invalid format" do
    changeset = Credential.registration_changeset(
      %Credential{}, Map.put(@valid_attrs, :email, "foo.com")
    )
    refute changeset.valid?
  end

  test "registration, passwords dont match" do
    changeset = Credential.registration_changeset(
      %Credential{}, Map.put(@valid_attrs, :password, "bla")
    )
    refute changeset.valid?
  end

  test "registration, password too short" do 
    changeset = Credential.registration_changeset(
      %Credential{}, 
      %{email: "test@test.com", password: "bla", password_confirmation: "bla"}
    )
    refute changeset.valid?
  end
end
