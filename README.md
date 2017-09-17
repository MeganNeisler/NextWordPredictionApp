# NextWordPredictionApp
This predication application takes a phrase and outputs a prediction of up to 4 next probable words.  The results are generated automatically as the user types, quickly displaying and updating the results based on the provided input. This was completed for the capstone project of the Coursera Data Science specialization held by professors of the Johns Hopkins University and in cooperation with SwiftKey.

## Application Fields
* Inputs
  * Input text: User inputted sentence or phrase.
  * Number of predicted words: User selects the number of words they would like to predict.
  
* Outputs
  * Predicted Next Word(s): Displays next most likely words based on provided input.
  * Current Word Being Typed: Displays the most likely word being typed by the user.
  
## Model
* The model for this app uses the N-gram backoff model. The model searches through the 4-gram data for the last three words of input.

## Built With
* [Shiny](https://shiny.rstudio.com/): An open source R package used to build interative web apps from R.
* [RWeka](https://cran.r-project.org/web/packages/RWeka/index.html): A collection of machine learning algorithms for data mining tasks
* Dataset: This text prediction model was built based on a sample dataset from a corpus, called the HC Corpra, consisting of real english news, blog and twitter feed text.

## Relevant Links
- [Presentation Overview](https://rpubs.com/MNeisler/262373)
- [Shiny App](https://rpubs.com/MNeisler/262373)

## Author
* Megan Neisler

## Acknowledgement
- [SwiftKey] (https://swiftkey.com/en) who provided the dataset for this project. 
- This was completed as part of the Capstone Project for the Johns Hopkins Data Science Specialization. Thanks to the professors and coursea for developing this project idea and their guidance along the way. 
