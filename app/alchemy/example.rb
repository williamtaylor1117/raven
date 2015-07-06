require './alchemyapi'

demo_text = "A 22-year-old man who was drinking and celebrating the Fourth of July tried to launch a firework off the top of his head, killing him instantly, authorities said Sunday. Devon Staples and his friends had been drinking and setting off fireworks Saturday night in the backyard of a friend's home in eastern Maine, said Stephen McCausland, a spokesman for the state Department of Public Safety. Staples, 22, of Calais, a small city on the Canadian border, placed a reloadable fireworks mortar tube on his head and told his friends he was going to light it, McCausland said. But his friends urged him to stop. 'Apparently, he thought that was a great idea,' McCausland said. 'His friends they thought dissuaded him from doing it, and the next thing they knew, he ignited the fireworks and he was killed instantly.' Staples's brother Cody told the Daily News of New York that he was a few feet away when his brother lit the firework and was the first to come to his side after it exploded. 'There was no rushing him to the hospital. There was no Devon left when I got there,' said 25-year-old Cody Staples, who called it an accident. 'Devon was not the kind of person who would do something stupid. He was the kind of person who would pretend to do something stupid to make people laugh,' he said. Staples' death is the first fireworks fatality in Maine since the state legalized fireworks on Jan. 1, 2012, authorities said. Lawmakers had voted to repeal a 1949 law banning fireworks, reasoning the industry would create jobs and generate revenue. State fire marshals were also investigating several other Fourth of July fireworks accidents involving injuries in Friendship, Jefferson, Lebanon and Woodstock. They said most of the accidents involved burns and eye injuries. In Montana on Saturday, a 32-year-old man was killed at a Billings home in a fireworks accident involving a mortar tube. And in New Jersey, a 52-year-old man blew off a large piece of his left leg below the knee when he set off a tennis-ball sized firework in Leonia."

demo_url= "http://www.theblaze.com/stories/2015/07/05/not-everyone-likes-the-fourth-of-july-themed-al-jazeera-video-that-mocks-american-as-fat-gun-toting-racists/"

demo_html = "<meta name='description' itemprop='description' content='Beware of sharks (Thinkstock) Officials in Hawaii are reporting a fatal shark attack off the island of Maui and are barring swimmers from the area’s shoreline.  The Hawaii Department of Land and Natural Resources said the attack occurred on Wednesday.  Local news website Maui Now, citing a Maui fire official, said the victim was a 65-year-old woman who apparently had been snorkeling in the water and was found floating face-down with injuries to her torso believed to be from a shark attack near a popular surf spot called 'Dumps.' Related: Forget the Beach — Eat Your Way Across Maui Sometimes danger lurks in paradise (Thinkstock) The Department of Land and Natural Resources said a stretch of water along more than 4 miles (6.4 km) of shoreline in the area will be closed at least until noon local time on Thursday as a result of the death.  A tiger shark last month bit the arm of a person, causing severe but not fatal lacerations, at Hapuna Beach on Hawaii’s Big Island, officials said.'>"

alchemyapi = AlchemyAPI.new()

puts ''
puts ''
puts '############################################'
puts '#   Entity Extraction Example              #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.entities('text', demo_text, { 'sentiment'=>1 })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Entities ##'
	for entity in response['entities']
		puts 'text: ' + entity['text']
		puts 'type: ' + entity['type']
		puts 'relevance: ' + entity['relevance']
		print 'sentiment: ' + entity['sentiment']['type'] 
		
		#Make sure score exists (it's not returned for neutral sentiment
		if entity['sentiment'].key?('score')
			print ' (' + entity['sentiment']['score'] + ')'
		end

		puts ''
	end
else
	puts 'Error in entity extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Keyword Extration Example               #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.keywords('text', demo_text, { 'sentiment'=>1 })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Keywords ##'
	for keyword in response['keywords']
		puts 'text: ' + keyword['text']
		puts 'relevance: ' + keyword['relevance']
		print 'sentiment: ' + keyword['sentiment']['type'] 
		

		#Make sure score exists (it's not returned for neutral sentiment
		if keyword['sentiment'].key?('score')
			print ' (' + keyword['sentiment']['score'] + ')'
		end

		puts ''
	end
else
	puts 'Error in keyword extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Concept Tagging Example                 #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.concepts('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Concepts ##'
	for concept in response['concepts']
		puts 'text: ' + concept['text']
		puts 'relevance: ' + concept['relevance']
		puts ''
	end
else
	puts 'Error in concept tagging call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Sentiment Analysis Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing html: ' + demo_html
puts ''

response = alchemyapi.sentiment('html', demo_html)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Document Sentiment ##'
	puts 'type: ' + response['docSentiment']['type']
	
	#Make sure score exists (it's not returned for neutral sentiment
	if response['docSentiment'].key?('score')
		puts 'score: ' + response['docSentiment']['score']
	end
else
	puts 'Error in sentiment analysis call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Targeted Sentiment Analysis Example    #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.sentiment_targeted('text', demo_text, 'Denver')

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Targeted Sentiment ##'
	puts 'type: ' + response['docSentiment']['type']
	
	#Make sure score exists (it's not returned for neutral sentiment
	if response['docSentiment'].key?('score')
		puts 'score: ' + response['docSentiment']['score']
	end

else
	puts 'Error in targeted sentiment analysis call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Text Extraction Example                #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.text('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Extracted Text ##'
	puts 'text: ' + response['text']
	puts ''
else
	puts 'Error in text extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Author Extraction Example              #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.author('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Author ##'
	puts 'author: ' + response['author']
else
	puts 'Error in author extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Language Detection Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.language('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Language ##'
	puts 'text: ' + response['language']
	puts 'iso-639-1: ' + response['iso-639-1']
	puts 'native speakers: ' + response['native-speakers']
else
	puts 'Error in language detection call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Title Extraction Example               #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.title('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Title ##'
	puts 'title: ' + response['title']
else
	puts 'Error in title extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Relation Extraction Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.relations('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Relations ##'
	for relation in response['relations']
		if relation.key?('subject')
			puts 'subject: ' + relation['subject']['text']
		end

		if relation.key?('action')
			puts 'action: ' + relation['action']['text']
		end

		if relation.key?('object')
			puts 'object: ' + relation['object']['text']
		end
		puts ''
	end
else
	puts 'Error in relation extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Text Categorization Example            #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.category('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Category ##'
	puts 'text: ' + response['category']
	puts 'score: ' + response['score']
else
	puts 'Error in text categorization call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Feed Detection Example                  #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.feeds('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Feeds ##'
	for feed in response['feeds']
		puts 'feed: ' + feed['feed']
	end
else
	puts 'Error in feed detection call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Microformats Parsing Example            #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.microformats('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Microformats ##'
	for microformat in response['microformats']
		puts 'field: ' + microformat['field']
		puts 'data: ' + microformat['data']
		puts ''
	end
else
	puts 'Error in microformats parsing call: ' + response['statusInfo']
end

puts ''
puts ''


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Taxonomy Example            			 #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.taxonomy('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Taxonomy ##'
	for taxonomy in response['taxonomy']
		puts 'label: ' + taxonomy['label']
		puts 'score: ' + taxonomy['score']
		if taxonomy.key?('confident')
			puts 'confident: ' + taxonomy['confident']
		end
		puts ''
	end
else
	puts 'Error in taxonomy call: ' + response['statusInfo']
end

puts ''
puts ''


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Image Extraction Example            	 #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.image_extract('url', demo_url, { 'extractMode'=>'trust-metadata' })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Image Extraction ##'
	if response.key?('image')
		puts 'image: ' + response['image']
	end
	puts ''
else
	puts 'Error in image extraction call: ' + response['statusInfo']
end

puts ''
puts ''


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Combined Example            			 #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.combined('url', demo_url, { 'extract'=>'page-image,keyword,entity' })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Combined Data ##'
	if response.key?('keywords')
		puts 'Keywords:'
		for keyword in response['keywords']
			puts "\ttext: " + keyword['text']
			puts "\trelevance: " + keyword['relevance']
			puts ''
		end
	end
	if response.key?('image')
		puts 'image: ' + response['image']
		puts ''
	end
	if response.key?('entities')
		puts 'Entities:'
		for entity in response['entities']
			puts "\trelevance: " + entity['relevance']
			puts "\ttext: " + entity['text']
			puts "\tcount: " + entity['count']
			puts "\ttype: " + entity['type']
			if entity.key?('disambiguated')
				puts "\tdisambiguated: "
				if entity['disambiguated'].key?('dbpedia')
					puts "\t\tdbpedia: " + entity['disambiguated']['dbpedia']
				end
				if entity['disambiguated'].key?('freebase')
					puts "\t\tfreebase: " + entity['disambiguated']['freebase']
				end
			end
			puts ''
		end
	end
	puts ''
else
	puts 'Error in combined call: ' + response['statusInfo']
end

puts ''
puts ''


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Image Tagging Example            	 #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.image_tag('url', demo_url, { 'extractMode'=>'trust-metadata' })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Image Tagging ##'
	if response.key?('imageKeywords')
		puts 'Keywords:'
		for keyword in response['imageKeywords']
			puts "\ttext: " + keyword['text']
			puts "\tscore: " + keyword['score']
		end
	end
	puts ''
else
	puts 'Error in image tag call: ' + response['statusInfo']
end

path_to_test_image = 'dog.jpg'
test_image = File.binread(path_to_test_image)
puts 'Processing image: ' + path_to_test_image
puts ''

response = alchemyapi.image_tag('image', '', { 'imagePostMode'=>'raw' }, test_image)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Image Tagging ##'
	if response.key?('imageKeywords')
		puts 'Keywords:'
		for keyword in response['imageKeywords']
			puts "\ttext: " + keyword['text']
			puts "\tscore: " + keyword['score']
		end
	end
	puts ''
else
	puts 'Error in image tag call: ' + response['statusInfo']
end

puts ''
puts ''
