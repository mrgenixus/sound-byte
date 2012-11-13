xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title @channel.title
		xml.description @channel.summary
		xml.link channels_url(:rss)

		for episode in @channel.episodes
			xml.item do
				xml.title = episode.title
				xml.description = episode.subtitle
				xml.pubDate = episode.created_at
				xml.link = episode_url(episode, :rss)
				xml.guid = episode_url(episode, :rss)
			end
		end
	end
end