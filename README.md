== README

## This readme covers SpyderFrame, a web-based text analytics application using Alchemy API as the extraction engine.

Phase One: Back-end development using Ruby on Rails to handle the data processing, including the calls to Alchemy's servers and the parsing, storage, and indexing.

Phase Two: Front-end development using AngularJS to create a rich and interactive user experience.

Phase Three: Incorporate special features and visualization library for analyzing the extraction results.

What we're working with:

* Ruby version = 2.2.1p85

* Rails version = 4.2.2

* Java7 for ElasticSearch

* JRuby

* Major system dependencies include:

    -[ElasticSearch](https://github.com/EricLondon/Rails-4-ElasticSearch-dynamic-facets)


    -[AlchemyAPI Ruby SDK](https://github.com/AlchemyAPI/alchemyapi_ruby) and associated [API key](http://www.alchemyapi.com/api/register.html)

* Database = PostrgreSQL 9.4

* Note: download the SDK into the lib folder of the application. The API key should be visible to the application. This is a part of the SDK cloning process. The alchemyapi_parser.rb file in the services directory of the application handles the request and the parsing of the objects to the pg database.

* All questions should go to the project dev, [Joel Ramsey](https://github.com/joelramsey), via GitHub.