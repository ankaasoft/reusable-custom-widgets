properCase(String sentence){

  List wordList=sentence.split(" ");

  int nList=wordList.length;

  String newSentence="";
  String newWord="";
  for (int i=0;i<nList;i++){
    newWord=wordList[i][0].toUpperCase()+wordList[i].substring(1);
    if (i>0){
      newSentence=newSentence+" "+newWord;
    } else {
      newSentence=newWord;
    }
  }
  return newSentence;
}
