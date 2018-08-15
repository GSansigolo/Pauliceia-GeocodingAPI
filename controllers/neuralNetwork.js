//imports
let fs = require('fs')
let limdu = require('limdu');

//function machineLearning
exports.neuralNetwork = function(streetName){

    //use the fs to read the serialized classifier's state
    fs.readFile('train.json', 'utf8', function readFileCallback(err, data){
        if (err){    
            console.log(err);
        } else {

            // First, define our base classifier type (a multi-label classifier based on winnow):
            var TextClassifier = limdu.classifiers.multilabel.BinaryRelevance.bind(0, {
                binaryClassifierType: limdu.classifiers.Winnow.bind(0, {retrain_count: 10})
            });
    
            // Now define our feature extractor - a function that takes a sample and adds features to a given features set:
            var WordExtractor = function(input, features) {
                input.split(" ").forEach(function(word) {
                    features[word]=1;
                });
            };
    
            // Initialize a classifier with the base classifier type and the feature extractor:
            var intentClassifier = new limdu.classifiers.EnhancedClassifier({
                classifierType: TextClassifier,
                featureExtractor: WordExtractor
            });
    
            // Train and test:
            intentClassifier.trainBatch(JSON.parse(data));
            
            console.dir([streetName]); 

            console.dir(intentClassifier.classify(streetName)); 
                
            // Return the matched name
            return streetName

            }
        }) 
}


  