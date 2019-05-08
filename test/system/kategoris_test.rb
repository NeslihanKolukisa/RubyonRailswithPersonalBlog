require "application_system_test_case"

class KategorisTest < ApplicationSystemTestCase
  setup do
    @kategori = kategoris(:one)
  end

  test "visiting the index" do
    visit kategoris_url
    assert_selector "h1", text: "Kategoris"
  end

  test "creating a Kategori" do
    visit kategoris_url
    click_on "New Kategori"

    fill_in "Aciklama", with: @kategori.aciklama
    fill_in "Ad", with: @kategori.ad
    click_on "Create Kategori"

    assert_text "Kategori was successfully created"
    click_on "Back"
  end

  test "updating a Kategori" do
    visit kategoris_url
    click_on "Edit", match: :first

    fill_in "Aciklama", with: @kategori.aciklama
    fill_in "Ad", with: @kategori.ad
    click_on "Update Kategori"

    assert_text "Kategori was successfully updated"
    click_on "Back"
  end

  test "destroying a Kategori" do
    visit kategoris_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kategori was successfully destroyed"
  end
end
