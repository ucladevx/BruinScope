# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

company_list = [
	[ "Facebook", "Menlo Park, CA" ],
	[ "Amazon", "Seattle, WA"],
	[ "LinkedIn", "Sunnyvale, CA"],
	[ "Palantir", "Palo Alto, CA"],
	[ "Snap", "Los Angeles, CA"],
	[ "Stripe", "San Francisco, CA"],
	[ "Twitter", "San Francisco, CA"],
	[ "Google", "Mountain View, CA" ],
	[ "Uber", "San Francisco, CA" ],
	[ "Microsoft", "Redmond, WA" ],
	[ "Apple", "Cupertino, CA" ],
	[ "Airbnb", "San Francisco, CA" ]
]

company_list.each do |name, location|
	Company.create(name: name, location: location)
end



if User.count > 0
  user = User.first

  posts = [
    {
      title: "Great experience but took longer than expected",
      experience: "Phone screening with human resources, as a first assessment. Then first stage of phone coding interview using codepad focused on algorithmic question…",
      question: "Given the alphabet encoded as numbers (e.g., a=1, b=2, ..., z=26), and a sequence of numbers (e.g., \"23413259802\"), how many strings can be generated.",
      resources: "CS 118",
      company: "Facebook",
      position: "Software Engineering Internship",
      created_at: "13-12-2017".to_time    
    },
    {
      title: "Very Technical Interview",
      experience: "As most others have noted, the interview process is a 30-minute phone screener with a recruiter, then two back-to-back 45-minute video…",
      question: "Design a way for people with similar interests/hobbies to connect.",
      resources: "CS 131",
      company: "Uber",
      position: "Product Management Internship"
    },
    {
      title: "Pleasant experience. No complaints.",
      experience: "First Round: call with HR to discuss background and interest in fb. Then several multiple choice questions on Android. If you answer enough questions...",
      question: "Given inorder and postorder traversals, reconstruct a binary tree.",
      resources: "CS 35L",
      company: "Google",
      position: "Software Engineering Internship"
    },
  ]

  posts.each do |post|
    company = Company.where(name: post[:company]).first
    new_post = Post.create(title: post[:title], experience: post[:experience], question: post[:question], resources: post[:resources], position: post[:position]) do |p|
      p.user = user
      p.company = company
    end
    new_post.save
  end
end
