class Event < ActiveRecord::Base
  def self.all_freebies
    ['FOOD', 'MERCH', 'OTHER']
  end

  def self.with_freebies(freebies, sort_by)
    if freebies.nil?
      all.order sort_by
    else
      where(freebie: freebies.map(&:upcase)).order sort_by
    end
  end
end
