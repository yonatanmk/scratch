require_relative 'user_commits'

class MadlibGenerator

  def initialize(username)
    @username = username
  end

  def print_messages
    puts plain_messages
  end

  def convert_commits
    data = plain_messages.collect do |messages|
      message.downcase.split
    end
    binding.pry
  end


  private
  attr_reader :username

  def convertable_nouns
    [
      "assignment",
      "html",
      "css",
      "code",
      "commit",
      "merge",
      "username",
      "test",
      "file",
      "form",
      "page",
      "function",
      "readme"
    ]
  end

  def convertable_verbs
    [
      "fixes",
      "fixed",
      "fixing",
      "completes",
      "completing",
      "adds",
      "added",
      "adding",
      "update",
      "updating",
      "updates",
      "removes",
      "removing",
      "removed",
      "delete",
      "deletes",
      "merge"
    ]
  end

  def replacement_nouns
    [

    ]
  end

  def replacement_verbs
    [

    ]
  end



  def plain_messages
    UserCommits.new(@username).fetch_commits
  end
end

username = 'yonatanmk'
MadlibGenerator.new(username).convert_commits
