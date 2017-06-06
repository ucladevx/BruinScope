class SearchController < ApplicationController
  LIMIT_PER_CATEGORY = 5

  def search
    if params.key?(:query)
      @query = params[:query]
      query = @query.downcase
      @companies = ta_search_companies(query)
      @people = ta_search_people(query)
    end
    # get experience query params
    exp_params = params.select { |key,_| key.match /^exp_/ }
    unless exp_params.empty?
      @experiences = search_experiences(exp_params)
    end
  end

  def search_experiences(exp_params)
    # strip "exp_" from keys
    exp_params.keys.each do |old_key|
      new_key = old_key[4..-1]
      exp_params[new_key] = exp_params.delete old_key
    end
    exp_params = validate_exp_params(exp_params)
    return Post.where(exp_params)
  end
  
  def typeahead
    query = params[:query]
    query = query.downcase
    companies = ta_search_companies(query)
    people = ta_search_people(query)
    positions = ta_search_positions(query)
    results = companies.concat(people).concat(positions)
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
      pers[:image] = person.avatar.url
      puts pers[:image]
      pers[:search_category] = "person"
      people_arr.push(pers)
    end
    return people_arr
  end

  def ta_search_positions(query)
    # gets all unique position column values which are like the query
    positions = Post.where("LOWER(position) LIKE :query", query: "%#{query}%").select(:position).map(&:position).uniq
    positions_arr = []
    positions.each do |position|
      p = {}
      p[:name] = position
      p[:search_category] = "position"
      positions_arr.push(p)
    end
    return positions_arr
  end

  private

  def validate_exp_params(exp_params)
    exp_hash = {}
    valid_keys = ["position", "title"]
    exp_params.each do |key, val|
      if valid_keys.include? key
        exp_hash[key] = val
      end
    end
    return exp_hash
  end
end
