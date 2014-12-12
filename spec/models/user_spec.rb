describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should ensure_length_of(:bio).is_at_most(500) }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

end
