class User < ActiveRecord::Base
  RESERVED_USERNAME = %w(vote votes race races user users voterace voteraces mypage auth logout login signin signup admin status privacy about).freeze

  has_many :social_profiles
  has_many :votes
  has_many :races

  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false
  validates_exclusion_of :username, in: RESERVED_USERNAME, message: 'Username has already been taken'

  def to_param
    username
  end

  def voted_candidate(race)
    if vote = votes.find_by(race: race)
      vote.candidate
    end
  end
end
