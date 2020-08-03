module BoardsHelper
  def display_bm(board)
    if board.users.count > 0
      return board.users.map { |user| user.account }.join(" / ")
    else
      return "徵求中"
    end
  end
end
