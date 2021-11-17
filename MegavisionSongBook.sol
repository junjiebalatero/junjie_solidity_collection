pragma solidity ^0.4.6;

// https://medium.com/robhitchens/solidity-crud-part-1-824ffa69509a
// https://bitbucket.org/rhitchens2/soliditycrud/src/master/contracts/SolidityCRUD-part1.sol
//
// the python client for this contract is available at 
// https://colab.research.google.com/drive/1JQAze2ZxRF1_AsGbdyQWr82XsFWPP3gk?usp=sharing
//

contract MegavisionSongBook {

  struct dataRecord {
    string songTitle;	    // song_title
    string songArtist;		// song_artist
    string songDescription;	// song_Description    
    uint songIdIndex;        // song_no
  }

  mapping(uint => dataRecord) private dataBase9;
  uint[] private db9Index;

  event LogNewSong   (string songTitle , string songArtist , string songDescription , uint songIdIndex , uint songID);
  event LogUpdateSongArtist(string songTitle , string songArtist, string songDescription);
  event LogDeleteSong(string songTitle, uint songIdIndex);

  function isSong(uint songIDck)
    public 
    constant
    returns(bool isIndeed) 
  {
    if(db9Index.length == 0) return false;
    return (db9Index[dataBase9[songIDck].songIdIndex] == songIDck);
  }

    function insertSong(
    string songTitle,
    string songArtist,
    string songDescription,
    uint    songID) 
    public
  {
    if(isSong(songID)) revert('duplicate'); 
    dataBase9[songID].songTitle = songTitle;
    dataBase9[songID].songArtist = songArtist;
    dataBase9[songID].songDescription = songDescription;
    dataBase9[songID].songIdIndex     = db9Index.push(songID)-1;
    emit LogNewSong(
        dataBase9[songID].songTitle, 
        dataBase9[songID].songArtist, 
        dataBase9[songID].songDescription,         
        dataBase9[songID].songIdIndex,
        songID);
  }

    function getSongData(uint songIDck)
    public 
    constant
    returns(string songTitle , string songArtist, string songDescription)
  {
    if(!isSong(songIDck)) revert ('not exist'); 
    return(
      dataBase9[songIDck].songTitle, 
      dataBase9[songIDck].songArtist,
      dataBase9[songIDck].songDescription);
  }
  
  

    function updateSong(uint songID, string newTitle, string newArtist , string newDescription) 
    public
    returns(bool success) 
  {
    if(!isSong(songID)) revert('not found'); 
    dataBase9[songID].songTitle = newTitle;
    dataBase9[songID].songArtist = newArtist;
    dataBase9[songID].songDescription = newDescription;
    emit LogUpdateSongArtist(
      dataBase9[songID].songTitle,
      dataBase9[songID].songArtist,
      dataBase9[songID].songDescription);
    return true;
  }

    function getSongCount() 
    public
    constant
    returns(uint count, string retString)
  {
    return (db9Index.length,'Hello World its me junjie ');
  }

  function deleteSong(uint songID) 
    public
  {
    if(!isSong(songID)) revert('not found'); 
    string storage songTitleToDelete = dataBase9[songID].songTitle;
    uint rowToDelete = dataBase9[songID].songIdIndex;
    uint keyToMove = db9Index[db9Index.length-1];
    db9Index[rowToDelete] = keyToMove;
    dataBase9[keyToMove].songIdIndex = rowToDelete; 
    db9Index.length--;
    emit LogDeleteSong(
      songTitleToDelete, 
      rowToDelete);
  }
  
}