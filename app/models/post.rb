class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :non_clickbait

    def non_clickbait
        array = ["Won't Believe","Secret","Top [number]","Guess"]
        if self.title == nil || !array.any? {|phrase| self.title.include? phrase}
            errors.add(:title, "is invalid if not clickbait")
        end
    end
end
