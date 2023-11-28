% Training Data
% Example: train(instance([feature1, feature2], class))
train(instance([1, 1], positive)).
train(instance([1, 0], positive)).
train(instance([0, 1], negative)).
train(instance([0, 0], negative)).
train(instance([1, 1], positive)).
train(instance([0, 1], negative)).
train(instance([1, 0], positive)).
train(instance([0, 0], negative)).

% Define classes explicitly
class(positive).
class(negative).

% Naive Bayes Classifier
classify(Features, Class) :-
    findall(Class-Probability, (class(Class), probability(Features, Class, Probability)), Probabilities),
    max_probability(Probabilities, Class).

probability(Features, Class, Probability) :-
    class(Class),
    count_class(Class, TotalClass),
    count_features_given_class(Features, Class, CountFeaturesGivenClass),
    LaplaceSmoothingFactor is 1, % Laplace smoothing factor
    Probability is (CountFeaturesGivenClass + LaplaceSmoothingFactor) / (TotalClass + LaplaceSmoothingFactor * 2).

count_class(Class, Count) :-
    findall(1, train(instance(_, Class)), Classes),
    length(Classes, Count).

count_features_given_class(Features, Class, Count) :-
    findall(1, (train(instance(InstanceFeatures, Class)), features_match(InstanceFeatures, Features)), Matches),
    length(Matches, Count).


features_match(InstanceFeatures, Features) :-
    InstanceFeatures = Features.


max_probability([Class-_], Class).
max_probability([Class1-Prob1, Class2-Prob2 | Rest], MaxClass) :-
    (Prob1 >= Prob2 ->
        max_probability([Class1-Prob1 | Rest], MaxClass)
    ;
        max_probability([Class2-Prob2 | Rest], MaxClass)
    ).

% Classify a new instance
classify_instance(Features) :-
    classify(Features, Class),
    format('Features: ~w, Predicted Class: ~w~n', [Features, Class]).

% Test Cases:
:- classify_instance([1, 0]). % Predicted Class: negative
:- classify_instance([0, 1]). % Predicted Class: negative
:- classify_instance([1, 1]). % Predicted Class: positive
:- classify_instance([0, 0]). % Predicted Class: negative
:- classify_instance([1, 1]). % Predicted Class: positive
