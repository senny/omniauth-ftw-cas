require_relative "../test_helper"

class UserTest < OmniAuth::Ftw::TestCase
  User = OmniAuth::Ftw::CAS::User

  def test_4teamwork_user_has_application_access
    user = User.new({"extra" => {"organization" => "4teamwork AG"}})
    assert user.application_access?
  end

  def test_other_users_dont_have_application_access
    user = User.new({"extra" => {"organization" => "other"}})
    refute user.application_access?

    user = User.new({"extra" => {}})
    refute user.application_access?
  end

  def test_name_is_composed_of_first_and_lastname
    user = User.new({"extra" => {"firstname" => "Peter", "lastname" => "Becker"}})
    assert_equal "Peter Becker", user.name
  end

  def test_gravatar_id_is_calculated_from_email
    user = User.new({"info" => {"email" => "p.becker@yahoo.com"}})
    assert_equal "69b6e9925634da81ec06f850c69a0377", user.gravatar_id
  end

  def test_does_not_crash_with_emtpy_hash
    user = User.new({})
    assert_nil user.email
    assert_nil user.github_username
    assert_nil user.gravatar_id
    refute user.application_access?
  end
end
