# air_challenge
Challenge for AirApps

## Architecture
I implemented typical a MVP 

## How I built the view

I use a regular xib file. Storyboard is great when the app is small and one programmer works on it. But this one has a single View. I also work with viewcode, but for simplicity I decided to use a xib file.

## Main classes/structs

   <b>IconsViewController </b> : is the main view controller 
  
   <b>IconsPresenter</b> IconsPresenter.swift : Is the presenter 
  
   <b>IconsDelegate</b> : Is the delegate with a showData func that allow the presenter to inform the viewcontroller to update the view. This method pass to the ViewController the data to be used to reload tableView
  
   <b>IconNetwork</b> : Class to get data from API . I use Combine to get the data from API. I wrote a generic function to get data from API . The presenter make a subscription to this class
   
   <b> ImageLoader</b> : Is a support class justo to get the icon imagem from each icon. I wrote it base in this Donny Wals article https://betterprogramming.pub/how-to-efficiently-load-images-in-uitableviews-and-uicollectionviews-a39afd608b1a
  
  <b>Icon</b> : Represent one Icon to be presented in a single tableview row
  
  <b>Icons</b> : Represent the list of icons to be retrieved from the API
 
 
## Testing

I didn't write test for every class or method. 

## What I miss

I didn't apply any appIcon nor any splashScreen ( although I believe they are useful even in a job test like this ).

I didn't organize the list ordered by name. I had to write a simple map before tableview.reloadData()

