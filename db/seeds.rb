# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

company_list = [
	[ "Facebook", "Menlo Park, CA", "www.facebook.com" ],
	[ "Amazon", "Seattle, WA", "www.amazon.com"],
	[ "LinkedIn", "Sunnyvale, CA", "www.linkedin.com"],
	[ "Palantir", "Palo Alto, CA", "www.palantir.com"],
	[ "Snap", "Los Angeles, CA", "www.snap.com"],
	[ "Stripe", "San Francisco, CA", "www.stripe.com"],
	[ "Twitter", "San Francisco, CA", "www.twitter.com"],
	[ "Google", "Mountain View, CA", "www.google.com" ],
	[ "Uber", "San Francisco, CA", "www.uber.com" ],
	[ "Microsoft", "Redmond, WA", "www.microsoft.com" ],
	[ "Apple", "Cupertino, CA", "www.apple.com" ],
	[ "Airbnb", "San Francisco, CA", "www.airbnb.com" ]
]

company_list.each do |name, location, link|
	company = Company.where(name: name)
	if company.empty?
		puts "Creating company #{name}"
		Company.create(name: name, location: location, link: link)
	end
end



if User.count > 0
	puts "Creating seed posts"
	user = User.first

	posts = [
		{
			title: "Great experience but took longer than expected",
			experience: "Phone screening with human resources, as a first assessment. Then first stage of phone coding interview using codepad focused on algorithmic question…",
			question: "Given the alphabet encoded as numbers (e.g., a=1, b=2, ..., z=26), and a sequence of numbers (e.g., \"23413259802\"), how many strings can be generated.",
			resources: "CS 118",
			company: "Facebook",
			position: "Software Engineering Internship",
			offer: "accepted",
			difficulty: "avg"
		},
		{
			title: "Very Technical Interview",
			experience: "As most others have noted, the interview process is a 30-minute phone screener with a recruiter, then two back-to-back 45-minute video…",
			question: "Design a way for people with similar interests/hobbies to connect.",
			resources: "CS 131",
			company: "Uber",
			position: "Product Management Internship",
			offer: "no_offer",
			difficulty: "difficult"
		},
		{
			title: "Pleasant experience. No complaints.",
			experience: "First Round: call with HR to discuss background and interest in fb. Then several multiple choice questions on Android. If you answer enough questions...",
			question: "Given inorder and postorder traversals, reconstruct a binary tree.",
			resources: "CS 35L",
			company: "Google",
			position: "Software Engineering Internship",
			offer: "declined",
			difficulty: "avg"
		},
		{
			title: "Data Mining with Stripe",
			experience: "Had an awesome chat regarding Map Reduce and Hadoop with the interviewer. It was a very casual conversation that simultaneously tested my knowledge of data mining...",
			question: "Describe Map Reduce, Describe Hadoop's architecture",
			resources: "CS 145",
			company: "Stripe",
			position: "Data Science Internship",
			offer: "accepted",
			difficulty: "avg"
		},
	]

	posts.each do |post|
		company = Company.where(name: post[:company]).first
		new_post = Post.create(title: post[:title], experience: post[:experience],
													 question: post[:question], resources: post[:resources],
													 position: post[:position], offer: post[:offer],
													 difficulty: post[:difficulty]) do |p|
														 p.user = user
														 p.company = company
													 end
													 new_post.save
	end
end
