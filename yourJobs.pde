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
    
    if(jobs != null){ // as long as jobs is not empty 
       for (int i=0; i<jobs.size();i++){ // need size for special array since its list
       // loops through all the jobs 
           String jobTitle = jobs.getJSONObject(i).getString("title"); // getting only title for now for the job 
       // for each job get json object and get its title for showing on main window
           String jobLink = jobs.getJSONObject(i).getString("redirect_url");
       
           jobData = append(this.jobData, jobTitle + " - " + jobLink); // adding the title and link to the jobdata array   
      }
    }    
  }
 
  void saveToFile(){
    // creating users text file with their name
    PrintWriter pw = createWriter(userName + "'s Jobs.html"); // using htm so urls are clickable in text file
    
    // making the job link in text file clickable
    
    pw.println("<html><body>");
    pw.println("<h2>Jobs for " + userName + "</h2>");
     
    // putting the jobs and their url into the users text file 
    for (int i= 0; i<this.jobData.length; i++){
   
      String[] sections = this.jobData[i].split(" - "); // separating job title from url 
      String jobTitle = sections[0]; // grabing the title
      String jobLink = (sections.length > 1) ? sections[1] : ""; // if theres a job title and url, then take the url(2nd item) if not then use empty string
      // ? is just a short form of a if-else statement
    
      pw.println(jobTitle + " - <a href='" + jobLink + "'>" + jobLink + "</a><br>");
    }
  
    pw.println("</body></html>"); 
    pw.close();  // closing and saving text file    
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
    fill(122,40,50);
     
    for (int i= 0; i<this.jobData.length; i++){ 
      textAlign(LEFT, TOP);
      textSize(19);
      text(this.jobData[i], 25,y); // show job title and link on main window to user 
      y += 55; // keeps the job data from overlapping
    }
    y = 145; //resetting
   }
 }
