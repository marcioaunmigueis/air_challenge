# air_challenge
Challenge for AirApps

## Architecture
I implemented typical a MVP 

## Main classes/structs

   <b>IconsViewController </b> : is the main view controller 
  
   <b>IconsPresenter</> IconsPresenter.swift : Is the presenter 
  
   <b>IconsDelegate</B> : Is the delegate with a showData func that allow the presenter to inform the viewcontroller to update the view. This method pass to the ViewController the data to be used to reload tableView
  
   <b>IconNetwork</b> : Class to get data from API . I use Combine to get the data from API. I wrote a generic function to get data from API . The presenter make a subscription to this class
   
   <b> ImageLoader</b> : Is a support class justo to get the icon imagem from each icon. I wrote it base in this Donny Wals article https://betterprogramming.pub/how-to-efficiently-load-images-in-uitableviews-and-uicollectionviews-a39afd608b1a
  
  <b>Icon</b> : Represent one Icon to be presented in a single tableview row
  
  <b>Icons</b> : Represent the list of icons to be retrieved from the API
 
 
