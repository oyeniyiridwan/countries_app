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

# Images
![1](https://user-images.githubusercontent.com/61723507/201590998-807fe485-ef58-477c-8a83-bd90a05b5d41.png)

![2](https://user-images.githubusercontent.com/61723507/201591030-dc8bb78d-c715-4b24-a2f6-cb0508c1750c.png)  

![3](https://user-images.githubusercontent.com/61723507/201591046-6473ec3d-9a22-41ac-b3ea-2d9fb71c8a93.png)  

![4](https://user-images.githubusercontent.com/61723507/201591063-ade46b8f-8859-4355-9167-f8f482426465.png)  

![5](https://user-images.githubusercontent.com/61723507/201591081-0355a17b-bb7d-4d38-8e34-e002ad2b45f1.png)  

![6](https://user-images.githubusercontent.com/61723507/201591108-14cdbf1a-04ac-4e9c-9775-ad4f78342627.png)  

![7](https://user-images.githubusercontent.com/61723507/201591132-c58198b7-85e0-460c-af4a-fc47fb9086fb.png) 



