RSpec.feature 'winner_page: Shows winner or draw' do

  before do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(1)
    click_button("Rock")
  end

  scenario '1. should have players choice' do
    expect(page).to have_content("Your choice: Rock")
  end

  scenario '2. should have computers choice' do
    expect(page).to have_content("Computer\'s choice: Paper")
  end

  scenario '3. should have who wins' do
    expect(page).to have_content("Computer wins!")
  end

  scenario '4. should have play again button' do
    expect(page).to have_button("Play again?")
  end

  scenario '5. play again button should go to play page' do
    click_button("Play again?")
    expect(page).to have_content("Pick your weapon:")
  end

  scenario '6. should have new player button' do
    expect(page).to have_button("New player")
  end

  scenario '7. New player button should go to index page' do
    click_button("New player")
    expect(page).to have_content("Lets play Rock, Paper, Scissors!")
  end

end