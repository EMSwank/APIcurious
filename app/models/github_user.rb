class GithubUser
  def initialize(user)
    @github_service = GithubService.new
    @nickname = user.nickname
  end

   def commit_count
    pushes.sum(&:commit_count)
  end

   def repos
    github_service.get_url("users/#{nickname}/repos").map do |raw_repo|
      Repo.new(raw_repo)
    end
  end

   private

   def pushes
    raw_pushes.map do |raw_event|
      Pushes.new(raw_event)
    end
  end

   def raw_pushes
    github_service.get_url("users/#{nickname}/events").find_all do |event|
      event[:type] == 'Pushes'
    end
  end
end
