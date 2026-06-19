/* VAANI PATEL FINAL CS4UI PROJECT ****

Credits: Job Data From Adzuna - https://www.adzuna.ca 

WELCOME TO THE JOBGOBLIN 

*/


import g4p_controls.*;

// declaring global variables

JSONObject output; // whole api resposne here
JSONArray jobs; // makes a list of the jobs only got from api

//String savedJobs = "NONE";
String [] savedJobs = new String [100];
String jobFilter;

int salaryExp; // users experience in the id industry

boolean beganSearch = false; // tracking if user has started the search

myJobs personalData; 

PImage bg; // background logo

void setup(){
  
  createGUI();
  
  background(245,230,202); 
  size(1000,1000);
  
  personalData = new myJobs(""); // creating personalData with empty name
    
}

void draw(){
    
  fill(18,25,41);
  textSize(23);
  textAlign(CENTER,TOP);
  text("HELLO! I AM YOUR OWN JOBGOBLIN",width/2,35 );  
  text("BELOW ARE YOUR SEARCH RESULTS, " + personalData.userName + " ;" ,width/2,85); 
  
  // citation
  fill(220,140,40);
  text("Job data powered by Adzuna: https://www.adzuna.ca", width/2, 700); 

  personalData.drawJobData(jobs); // callinng the drawJobData method

 }
