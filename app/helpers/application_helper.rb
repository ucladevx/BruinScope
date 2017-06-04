module ApplicationHelper
  # Showcases correct user upload taking care of Anonymous
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
  # Presents the time something was created either in words
  # or in date format
  def show_date(time)
		if time > Time.now.beginning_of_day
			return "#{time_ago_in_words(time)} ago"
		else
			return time.strftime("%b %d, %Y")
		end
	end
end
