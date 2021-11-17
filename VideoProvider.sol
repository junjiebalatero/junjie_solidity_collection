pragma solidity ^0.4.18;

contract VideoProvider {
    struct UserInfo {
        uint Age;
        bool AgeRestriction;
    }
    mapping (string => UserInfo) AllUsers;
    
    function SetUserInfo(string _Name, uint _Age) public {
        
        AllUsers[_Name].Age = _Age;
        
        if (AllUsers[_Name].Age >= 18) {AllUsers[_Name].AgeRestriction = false;
        
        } else AllUsers[_Name].AgeRestriction = true;
    }
    
    function GetUserInfo(string _Name) public view returns (uint, bool) {
        
        return (AllUsers[_Name] . Age , AllUsers[_Name] . AgeRestriction);
        
    }
}