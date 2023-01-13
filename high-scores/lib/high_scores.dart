class HighScores {
    List <int> scores;
    HighScores(this.scores);

    int latest(){
        return scores.last;
    }

    int personalBest(){
        scores.sort();
        return scores.last;
    }

    List<int> personalTopThree(){
        scores.sort();
        if (scores.length > 3){
            return scores.sublist(scores.length - 3).reversed.toList(growable: false);
        }
        return scores.reversed.toList(growable: false);
    }
}