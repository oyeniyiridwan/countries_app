# countries_app
An app that gives insight about 20- 25 countries which includes;  
images of the flag and coat of arms.  
population, dialling code, independence, capital, currency, language e.t.c  
## Features
 Searchable by  name of country  
 Filters countries by region, sub-region, currency, capital  
 Supports both System Automatic dark mode and app dark/light mode  



# Code description
The code was structure using MVVM architecture;    
The lib directory contains Three newly created directories named;  
 ##  View:
Contains one directory(Screens) and two dart files(Filtered and Languages)  
Just as the name implies the directory contains the codes(Widgets) for the HomePage and Details Screens.  
The other two files are the showModalSheet codes(widgets)  

## Model
Contains Two dart files (Country and Countries)  
country is the Country Class files  
Countries contains code for retrieving data from the api, extracting data and the Provider(State Management) codes .  
 
## ViewModel
Contains usable Widget Files  


# Library Used
provider: ^6.0.4 -> For Managing the State of the App    
http: ^0.13.5 -> Used to send request likewise receive response  

# Challenges Faced

 Data Received from Api contains null values;    
Solution: I had to add a null checker to be able to work with it  
Setting up Filter and Search Features  
In other to ensure smooth and responsive operation within the app.   
 I noticed I had to make just one Api call. So I definitely need to make the duplicate of that response in other to create those features   

# Future Features
  Filter by Languages  
  Add Voice Search  

# Apk Link 
https://drive.google.com/file/d/1qq5JuQtqHc9DKeEi77dKgISjth8vkjir/view?usp=share_link  

# Appetize Link
https://appetize.io/app/uj45vj37owv4uogiqxqzziyqf4?device=pixel4&osVersion=11.0&scale=75  
