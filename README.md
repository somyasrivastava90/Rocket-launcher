# Rocket-launcher

This is a simple App to display list of rocket launches on the ViewController and details on DetailViewController.

This app shows the use of the following -
- MVVM pattern
- PromiseKit
- Use of JSONDecoder
- Unit Test Cases

The UI is designed keeping in mind Apple's Human Interface Guidelines and the app uses all native UI components.

Third party libraries used are -

- SDWebImage 
  - It is an asynchronous image downloader. 
  - It guarantees that the same URL for the image is not downloaded several times.
  - It also guarantees that main thread is never blocked.
             
- PromiseKit
  - It is used for asynchronous programming with easy to implement, and easy to read code. 
  - It also helps to separate success and error handling.
  - It makes the app robust

- SVProgressHUD 
  - It is an easy UI control to display refreshing action on the screen.


Assets used -
- placeholderRocket - It is used on the list of rocket launches when an image is not available from the JSON data
- largeRocketIcon - It is used on the detail page of rocket launch when an image is not available from the JSON data
- flagIcon - It is used to mark RUS, CHN and UKN to be “of particular interest” as requested in the App requirement documentation.
