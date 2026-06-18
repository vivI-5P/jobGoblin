class myJobs {

  // fields
  String userName;
  String [] jobData;
  
  // constructor
  
  myJobs(String n){
    this.userName = n;
    this.jobData = new String[0];
  }
  
  //methods
  
  void collectionOfData(JSONArray jobs){
    
    if(jobs != null){ // testing only runs if got data from api
       for (int i=0; i<jobs.size();i++){ // need size for special array since its list
       // loops through all the jobs 
           String jobTitle = jobs.getJSONObject(i).getString("title"); // getting only title for now for the job 
       // for each job get json object and get its title for showing on main window
           String jobLink = jobs.getJSONObject(i).getString("redirect_url");
       
           jobData = append(this.jobData, jobTitle + " - " + jobLink);            
      }
    }    
  }
 
  void saveToFile(){
    
    PrintWriter pw = createWriter(userName + "'s Jobs.txt");
    
   for (int i= 0; i<this.jobData.length; i++){
     
     pw.println(this.jobData[i]);
   }
   pw.close(); 
  }
    
  void drawJobData(JSONArray jobs){
    
    if (beganSearch == true && this.jobData.length == 0){
      // if there's no jobs available
      fill(255,0,0);
      textAlign(CENTER, CENTER);
      textSize(20);
      
      text("Whoops, sorry you've reached the end of the list", width/2, height/2);
      text("Meanwhile, make your resume stronger with more side projects", width/2, height/2 + 50);     
      return; // stops here
   }
    
    int y = 155;
    fill(255);
     
    for (int i= 0; i<this.jobData.length; i++){
      textAlign(LEFT, TOP);
      textSize(17);
      text(this.jobData[i], 50,y);
      y += 45;
    }
    y = 145; 
   }
}
