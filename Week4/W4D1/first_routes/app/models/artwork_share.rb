class ArtworkShare < ApplicationRecord

    validates :artwork_id, presence: true
    validates :viewer_id, presence: true
    validates :artwork_id, uniqueness: {scope: :viewer_id, message: "unique views per artwork"}

    belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

    belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

end
