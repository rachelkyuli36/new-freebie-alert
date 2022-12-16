class Event < ActiveRecord::Base

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy 
  def self.all_freebies
    ['FOOD', 'MERCH', 'OTHER']
  end

  def self.with_freebies(freebies, sort_by)
    # if freebies.nil?
    #   all.order sort_by
    # else
    #   where(freebie: freebies.map(&:upcase)).order sort_by
    # end

    # when freebies list is null we autofill to all of them
    where(freebie: freebies.map(&:upcase)).order sort_by
  end
end
