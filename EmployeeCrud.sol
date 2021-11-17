pragma solidity ^0.4.6;

contract EmployeeCrud {

  struct dataRecord {
    string empName;
    uint empSalary;
    uint empIdIndex;
  }
  
  mapping(uint => dataRecord) private dataBase9;
  uint[] private db9Index;

  event LogNewEmp   (string empName,uint empSalary, uint empIdIndex, uint empID);
  event LogUpdateEmpSal(string empName, uint empSalary);
  event LogDeleteEmp(string empName, uint empIdIndex);
  
  function isEmp(uint empIDck)
    public 
    constant
    returns(bool isIndeed) 
  {
    if(db9Index.length == 0) return false;
    return (db9Index[dataBase9[empIDck].empIdIndex] == empIDck);
  }

  function insertEmp(
    string empName,
    uint empSalary,
    uint    empID) 
    public
  {
    if(isEmp(empID)) revert('duplicate'); 
    dataBase9[empID].empName = empName;
    dataBase9[empID].empSalary   = empSalary;
    dataBase9[empID].empIdIndex     = db9Index.push(empID)-1;
    emit LogNewEmp(
        dataBase9[empID].empName, 
        dataBase9[empID].empSalary,
        dataBase9[empID].empIdIndex,
        empID);
  }
  
  function getEmpData(uint empIDck)
    public 
    constant
    returns(string empName, uint empSalary)
  {
    if(!isEmp(empIDck)) return('not found',0); 
    return(
      dataBase9[empIDck].empName, 
      dataBase9[empIDck].empSalary);

  } 

  function updateEmpSalary(uint empID, uint newSalary) 
    public
    returns(bool success) 
  {
    if(!isEmp(empID)) revert('not found'); 
    dataBase9[empID].empSalary = newSalary;
    emit LogUpdateEmpSal(
      dataBase9[empID].empName,
      dataBase9[empID].empSalary);
    return true;
  }

  function getEmpCount() 
    public
    constant
    returns(uint count, string retString)
  {
    return (db9Index.length,'Hello Prithwis - v1.0 ');
  }

function deleteEmp(uint empID) 
    public
  {
    if(!isEmp(empID)) revert('not found'); 
    string storage empNameToDelete = dataBase9[empID].empName;
    uint rowToDelete = dataBase9[empID].empIdIndex;
    uint keyToMove = db9Index[db9Index.length-1];
    db9Index[rowToDelete] = keyToMove;
    dataBase9[keyToMove].empIdIndex = rowToDelete; 
    db9Index.length--;
    emit LogDeleteEmp(
      empNameToDelete, 
      rowToDelete);
  }
  
//  function getUserAtIndex(uint index)
//    public
//    constant
//    returns(address userAddress)
//  {
//    return userIndex[index];
//  }

}