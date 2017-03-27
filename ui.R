library(shiny)

shinyUI(fluidPage(
        navbarPage("Next Word Prediction",
                   tabPanel("The App",
                            sidebarLayout(
                                    sidebarPanel(
                                            helpText( "Start typing a word or phrase in the text input box provided below."),
                                            h4('Input Text'), 
                                            tags$textarea(id="text_in", rows=2, cols=30),
                                            helpText( "Select the number of words you'd like to predict."),
                                            numericInput("suggestions",  h4("Number of predicted words"),
                                                         value = 4, min=1, max =4),
                                            HTML("<br><br>")
                                    ),
                                    mainPanel(
                                            h3("Welcome!"),
                                            HTML("<p> This application predicts the next most probable words based on the text you provide. As you type, the predicted next word will be evaluated automatically."),
                                            HTML("<br><br>"),
                                            h3("Predicted Next Word(s)"),
                                            verbatimTextOutput('word.next'),
                                            helpText( "The next most likely word(s) to follow your input text. This will be displayed once you have finished typing at least one or more words."),
                                            HTML("<br>"),
                                            h3("Current Word Being Typed"),
                                            verbatimTextOutput('word.current'),
                                            helpText( "Shows the most likely word you currently are trying to type.")
                                            
                                            
                            )
                            )
                   ),
                   tabPanel("About",
                            headerPanel("About this Application"),
                            mainPanel(
                                    h3("The Data"),
                                    p("The text prediction model was built based on a sample dataset from a corpus, called the HC Corpra, consisting of real english news, blog and twitter feed text. The data was then used to build an n-gram table, which shows the frequency of one, two, three and four words."),
                                    h3("Description of Algorithm"),
                                    p("The model for this app uses the backoff model,"), 
                                    a(href="http://en.wikipedia.org/wiki/N-gram", "N-gram"),
                                    p("The model starts with the quadgram model to predict the next words and if that does not work then it would look at the trigram, bigram and finally the unigram model as necessary."),
                                    p("The code is available for review at:"),
                                    a(href="https://github.com/MeganNeisler/NextWordPredictionApp", "Github - NextPrediction App"),
                                    h3("Author"),
                                    p("This app was created by Megan Neisler.")
                            )
                            )
                   )
        )
)
