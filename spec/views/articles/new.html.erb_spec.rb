require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :article_title => "MyString",
      :article_type => 1,
      :article_content => "MyText",
      :aritle_read_times => 1,
      :user_id => 1
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_article_title[name=?]", "article[article_title]"

      assert_select "input#article_article_type[name=?]", "article[article_type]"

      assert_select "textarea#article_article_content[name=?]", "article[article_content]"

      assert_select "input#article_aritle_read_times[name=?]", "article[aritle_read_times]"

      assert_select "input#article_user_id[name=?]", "article[user_id]"
    end
  end
end
