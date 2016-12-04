require 'spec_helper.rb'

feature 'creating new peeps' do

  let!(:user) do
    User.create(name: 'Amanda',
                username: 'amanda',
                email: 'hello@example.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'user can create a new peep' do
    sign_in(email: user.email, password: user.password)
    visit '/chitter'
    fill_in 'message', with: 'I have just joined Chitter!'
    click_button 'peep'

    within 'ul#peeps' do
      expect(page).to have_content('I have just joined Chitter!')
    end
  end

end
