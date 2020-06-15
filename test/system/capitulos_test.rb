require "application_system_test_case"

class CapitulosTest < ApplicationSystemTestCase
  setup do
    @capitulo = capitulos(:one)
  end

  test "visiting the index" do
    visit capitulos_url
    assert_selector "h1", text: "Capitulos"
  end

  test "creating a Capitulo" do
    visit capitulos_url
    click_on "New Capitulo"

    click_on "Create Capitulo"

    assert_text "Capitulo was successfully created"
    click_on "Back"
  end

  test "updating a Capitulo" do
    visit capitulos_url
    click_on "Edit", match: :first

    click_on "Update Capitulo"

    assert_text "Capitulo was successfully updated"
    click_on "Back"
  end

  test "destroying a Capitulo" do
    visit capitulos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Capitulo was successfully destroyed"
  end
end
