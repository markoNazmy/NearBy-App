# NearBy-App

This app to connect with Foursquare API to apply MVP pattern and enhancing it with migrating it to MVVM With RX.

## Architecture

* The current architecture is MVP with Usecase and Repository flavors
* the app has no base layers because it's till now depending on one screen only.
* The app is using enums and structs with protocols as applying for Protocol Oriented Programming as Apple recommends.
* the app is depending on generics in the Model layers. 

## Libraries

  * 'SwiftLint' and 'SwiftFormat' for keeping the code clean without warning and bad dirty code.
  * 'Alamofire' for networking and I used the cache mechanism in Alamofire to cache my requests.
  * 'ObjectMapper' for mapping the response to its own models.
  * 'Result' it's a pattern more than a library to handle the response in a result pattern of two cases (success or failure).
  * 'AlamofireObjectMapper' for connecting Alamofire with ObjectMapper in mapping the response.
  * 'Kingfisher' for downloading images and caching it.
  
## Enhancements

The app could be enhanced by some steps: 

* Migration to MVVM and RXswift.
* Implementing my Own caching mechanism.
* Add UI unit tests.

## Author

Marko Nazmy Armya. 
[email me](mailto:marko.nazmy@gmail.com)

## License

MNExpandableCell is available under the MIT license. See the LICENSE file for more info
