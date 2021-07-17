module ApplicationHelper
  def max_width
    if controller_name == "comments" && action_name == "show"
      "mw-md"
    elsif devise_controller?
      "mw-sm"
    else
      "mw-xl"
    end
  end

  def index_title(genre)
    case genre
    when nil
      "すべて"
    when "invisible"
      "分類未設定"
    when "appetizer"
      "前菜/温菜"
    when "main"
      "メイン/パスタなど"
    when "dessert"
      "デザート"
    when "drink"
      "ドリンク"
    end
  end
end
