class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    player_1 = User.find(object.player_1_id)
    player_2 = User.find(object.player_2_id)
    [
      {user_id: player_1.id,
      score: player_1.score},
      {user_id: player_2.id,
       score: player_2.score}
    ]
  end
end
