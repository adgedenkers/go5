# == Schema Information
# Schema version: 20110215150640
#
# Table name: urls
#
#  id         :integer         not null, primary key
#  full       :string(255)
#  short      :string(255)
#  user_id    :integer
#  title      :string(255)
#  count      :integer
#  last       :date
#  created_at :datetime
#  updated_at :datetime
#

class Url < ActiveRecord::Base
  belongs_to :user
  attr_accessible(:full, :short, :user_id, :title, :count, :last)
  
  def self.find_top_urls
    find(:all)
  end
  
  validates :full,  :presence   => true
  validates :short, :presence   => true,
                    :uniqueness => { :case_sensitive => true }
end
