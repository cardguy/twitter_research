class Tweet < ActiveRecord::Base
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :categories_as_string)
  #allows mass assignment. never put a foriegn key in here.
  #only what you want a user to be able to use



  validates(:twitter_user, :presence => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence => true)

  scope(:with_notes, includes(:notes).order('notes.created_at desc'))


        belongs_to(:user)
        has_many(:notes, :dependent => :delete_all)
        has_and_belongs_to_many(:categories)

        def suggested_categories
          titles = Category.all.map(&:title).map(&:downcase)
          tweet = tweeted_text.gsub(/[^\w\s]/, ' ').downcase.split.sort
          (tweet & titles).map(&:capitalize).sort.join(', ')
        end

        ##############################################################
        # Returns comma separated string of the current category titles.
        def categories_as_string
          categories.map(&:title).sort.join(', ')

        end
        ###########################################################################
        # Given a comma separated string of category titles, reset the
        # categories for this tweet to the categories in the string.

        def categories_as_string= (new_categories)
          categories.clear
          new_categories.split(/\s*,\s*/).each do |title|
            cat = Category.where('LOWER(title) = ?', title.downcase).first
            categories << cat if !cat.nil?
          end
        end
      end

