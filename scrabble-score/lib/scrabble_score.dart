// Put your code here

double score(String word){
    var wordScore = {
        1 : ["a","e","i","o","u","l","n","r","s","t"],
        2 : ["d", "g"],
        3 : ["b", "c", "m", "p"],
        4 : ["f","h","v","w","y"],
        5 : ["k"],
        6 : ["j", "x"],
        7 : ["q", "z"]
    };

    double count = 0;
    word = word.toLowerCase();
    for (int i=0; i<word.length; i++){
        String letter = word.substring(i, i+1);
        wordScore.forEach((key, value){
            if (value.contains(letter)){
                count += key;
            };
        });
    }
    return count;
}