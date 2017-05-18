module ApplicationHelper
  def sanitized_user_name(user)
    return (user.nil?) ? "Anonymous User" : user.full_name
  end
  def formatted_post_offer(post)
    if post.offer == "no_offer"
      return "✗No offer"
    else
      return "✓Offer"
    end
  end
  def formatted_post_diffculty(post)
    case post.difficulty
    when "easy"
      return 'Easy Interview'
    when "avg"
      return 'Average Interview'
    when "difficult"
      return 'Difficult Interview'
    else
      return ""
    end
  end
end
