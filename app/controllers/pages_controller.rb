class PagesController < ApplicationController
  def index
    @homepage_links = homepage_lists
  end

  def about
  end

  def homepage_lists
    list = {
      announce: "精華公佈欄",
      favorite: "我的最愛",
      class: "分組討論區"
    }
  end
end
