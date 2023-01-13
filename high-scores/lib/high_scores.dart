class HighScores {
    List <int> scores;
    HighScores(this.scores);

    int latest(){
        return scores.last;
    }

    int personalBest(){
        var listCopy = List.of(scores);
        listCopy.sort();
        return listCopy.last;
    }

    List<int> personalTopThree(){
        var listCopy = List.of(scores);
        listCopy.sort();
        var result;
        if (listCopy.length > 3){
            return listCopy.sublist(listCopy.length - 3).reversed.toList(growable: false);
        }
        return listCopy.reversed.toList(growable: false);
    }
}