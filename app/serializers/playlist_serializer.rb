class PlaylistSerializer < ActiveModel::Serializer
  
  attributes :id,
  :user_id,
  :track_id,
  :clock_time,
  :seek_time,
  :priority,
  :now_playing,
  :key,
  :username,
  :title,
  :src, 
  :created_at,
  :updated_at

end