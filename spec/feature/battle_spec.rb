
Capybara.default_driver = :selenium

RSpec.feature "Battle Names", type: :feature do

  scenario "User enters two player names" do
    sign_in_and_play

    expect(page).to have_content('Pikachu vs. Charizard')
  end
end

RSpec.feature "Display hit points", type: :feature do
  scenario "Show player 2's hit points" do

    sign_in_and_play

    expect(page).to have_content("Charizard: #{100}HP")
  end
end


RSpec.feature "Attacking P2", type: :feature do
  scenario "Player 1 should attack Player 2" do

    sign_in_and_play
    expect(page).not_to have_content "Pikachu attacked Charizard!"

    click_button("attack")

    expect(page).to have_content "Pikachu attacked Charizard!"

  end

  scenario "Player 2's health should decrease by 10HP" do
    sign_in_and_play
    srand(55)
    attack!
    expect(page).to have_content("Charizard: 85HP")

  end

end

RSpec.feature "Turn switching", type: :feature do

  scenario "should display who's turn to attack it is" do
    sign_in_and_play
    expect(page).to have_content("Pikachu's turn!")
  end
  scenario "after attacking player two, player one should be attacked" do
    sign_in_and_play
    attack!
    attack!
    expect(page).not_to have_content("Pikachu: 100HP")
  end
end

RSpec.feature "Losing", type: :feature do
  scenario "should display player has lost! if HP reaches 0" do
    sign_in_and_play
    19.times {attack!}
    expect(page).to have_content("Charizard has lost!")
  end
end

RSpec.feature "Extra moves", type: :feature do

  scenario "the paralyse move" do
    sign_in_and_play
    srand(1)
    click_button("paralyse")
    expect(page).to have_content("Charizard was paralysed!")
  end

  scenario "paralysed pokemon can't attack" do
    sign_in_and_play
    srand(1)
    click_button("paralyse")
    click_button("proceed")
    click_button("attack")
    expect(page).to have_content("Charizard is paralysed")
  end
end
