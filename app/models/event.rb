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

  def self.upcoming(freebies)
    #Citation: https://stackoverflow.com/questions/32438063/check-if-date-is-within-the-past-seven-days
    #Citaation: https://www.algolia.com/doc/guides/managing-results/refine-results/filtering/how-to/filter-by-date/?client=ruby
    #Citation: https://www.rubyguides.com/2019/07/rails-where-method/
    #Citation: https://ruby-doc.org/core-2.6.3/Time.html

    n = Time.now
    n_str = n.strftime("%Y-%m-%d")
    freebies.where("? <= event_date",n_str)
 end

 def self.past(freebies)
  n = Time.now
  n_str = n.strftime("%Y-%m-%d")
  freebies.where("? > event_date",n_str)
end

end
