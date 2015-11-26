== README

## This readme covers Raven, a web-based text analytics application using Alchemy API as the extraction engine.

Phase One: Back-end development using Ruby on Rails to handle the data processing, including the calls to Alchemy's servers and the parsing, storage, and indexing.

Phase Two: Front-end development using AngularJS to create a rich and interactive user experience.

Phase Three: Incorporate special features and visualization library for analyzing the extraction results.

What we're working with:

* Ruby version = 2.2.1p85

* Rails version = 4.2.2

* JRuby

* Major system dependencies include:


    -[AlchemyAPI Ruby SDK](https://github.com/AlchemyAPI/alchemyapi_ruby) and associated [API key](http://www.alchemyapi.com/api/register.html)

* Database = PostrgreSQL 9.4 for production and sqlite3 for development

* Note: download the SDK into the lib folder of the application. The API key should be visible to the application. This is a part of the SDK cloning process. The alchemyapi_parser.rb file in the services directory of the application handles the request and the parsing of the objects to the pg database.

* All questions should go to the project dev, [Joel Ramsey](https://github.com/joelramsey), via GitHub.