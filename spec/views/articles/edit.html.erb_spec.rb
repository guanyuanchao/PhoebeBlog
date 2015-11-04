require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :article_title => "MyString",
      :article_type => 1,
      :article_content => "MyText",
      :aritle_read_times => 1,
      :user_id => 1
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_article_title[name=?]", "article[article_title]"

      assert_select "input#article_article_type[name=?]", "article[article_type]"

      assert_select "textarea#article_article_content[name=?]", "article[article_content]"

      assert_select "input#article_aritle_read_times[name=?]", "article[aritle_read_times]"

      assert_select "input#article_user_id[name=?]", "article[user_id]"
    end
  end
end
