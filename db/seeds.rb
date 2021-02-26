require "httparty"
require "json"

GamePlatform.delete_all
GameDeveloper.delete_all
Platform.delete_all
Game.delete_all
Developer.delete_all

api_key = "?api_key=76ecf494ef441e54dc89975fa965ef4c7d69cce5"

api_root_path = "https://www.giantbomb.com/api/"

json_format = "&format=json"

def api_fetch(url)
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

games = api_fetch("#{api_root_path}games/#{api_key}#{json_format}&limit=50")

games["results"].each do |g|
  game = (api_fetch("#{g['api_detail_url']}#{api_key}#{json_format}"))["results"]
  new_game = Game.create(
    name:        game["name"],
    description: game["deck"]
  )

  new_developers = game["developers"]
  unless new_developers.nil?
    new_developers.each do |d|
      developer = (api_fetch("#{d['api_detail_url']}#{api_key}#{json_format}"))["results"]
      new_game.developers.find_or_create_by(
        name:        developer["name"],
        description: developer["deck"],
        country:     developer["country"],
        city:        developer["city"]
      )
    end
  end

  game["platforms"].each do |console|
    platform = (api_fetch("#{console['api_detail_url']}#{api_key}#{json_format}"))["results"]
    new_game.platforms.find_or_create_by(
      name:         platform["name"],
      description:  platform["deck"],
      install_base: platform["install_base"]
    )
  end
end


# game["platforms"].each do |console|
#   platform = (api_fetch("#{console['api_detail_url']}#{api_key}#{json_format}"))["results"]
#   unless Platform.find_by(name: platform["name"]).present?
#     new_game.platforms.create(
#       name:           platform["name"]
#       # description:    platform["deck"],
#       # install_base:   platform["install_base"]
#     )
#   end
# end