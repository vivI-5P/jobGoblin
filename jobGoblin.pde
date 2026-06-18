import g4p_controls.*;

myJobs personalData; // variable that'll store username and saved jobs later

// declaring global variables

JSONObject output; // whole api resposne here
JSONArray jobs; // makes a list of the jobs only got from api

//String savedJobs = "NONE";
String [] savedJobs = new String [100];
String jobFilter;

int salaryExp; // users experience in the id industry

boolean beganSearch = false; // tracking if user has started the search

void setup(){
  
  createGUI();
  
  size(1000,600);
  
  personalData = new myJobs(""); // creating personalData with empty name
}

void draw(){
  
  background(193, 154, 107);
  
  fill(255, 253, 208);
  textSize(25);
  textAlign(CENTER,TOP);
  text("WELCOME TO JOBGOBLIN DEAR USER",width/2,35 );  
  text("BELOW ARE YOUR SEARCH RESULTS, " + personalData.userName + " ;" ,width/2,100 ); 

  personalData.drawJobData(jobs); // callinng the drawJobData method

 }
