class SearchController < ApplicationController
  LIMIT_PER_CATEGORY = 5

  def search
    @results = Post.all
    @query = params[:query]
    query = @query.downcase
    @companies = ta_search_companies(query)
    @people = ta_search_people(query)
  end

  def typeahead
    query = params[:query]
    query = query.downcase
    companies = ta_search_companies(query)
    people = ta_search_people(query)
    results = companies.concat(people)
    respond_to do |format|
      format.json { render json: results.to_json, content_type: 'application/json' }
    end
  end

  def ta_search_companies(query)
    companies = Company.where("LOWER(name) LIKE :query", query: "%#{query}%").limit(LIMIT_PER_CATEGORY)
    companies_arr = []
    companies.each do |company|
      c = {}
      c[:id] = company[:id]
      c[:name] = company[:name]
      c[:image] = company[:image]
      c[:search_category] = "company"
      companies_arr.push(c)
    end
    return companies_arr
  end

  def ta_search_people(query)
    words = query.split(" ")
    if words.size > 1
      first = words[0]
      last = words[1]
      people = User.where("LOWER(first_name) LIKE :first AND  LOWER(last_name) LIKE :last", first: "%#{first}%", last: "%#{last}%").limit(LIMIT_PER_CATEGORY)
    else
      people = User.where("LOWER(first_name) LIKE :query OR LOWER(last_name) LIKE :query", query: "%#{query}%").limit(LIMIT_PER_CATEGORY)
    end

    people_arr = []
    people.each do |person|
      pers = {}
      pers[:id] = person[:id]
      pers[:name] = [person[:first_name], person[:last_name]].join(' ')
      pers[:search_category] = "person"
      people_arr.push(pers)
    end
    return people_arr
  end
end
