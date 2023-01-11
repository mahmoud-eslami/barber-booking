<p align="center">
    <img src="https://github.com/mahmoud-eslami/barber_booking/blob/master/screen_shots/cut.png" width="140">
    <h3 align="center">Barber-shop booking</h3>
    <h6 align="center">This is a barber-shop booking platform . Firebase 💛 as Backend service and Flutter 💙 used as client technology.</h6>
    <p align="center">
</p><br>

## Project / Folder structure :

```python
- /app  
# This is where all the application's directories will be contained  
    - /data
        - /enums 
        - /services
             # Here our repositories are just classes that will mediate the communication between our controller and our data.
             # Our controllers won't need to know where the data comes from, and you can use more than one repository on a controller if you need to.
        - /model
        # Our classes, or data models responsible for abstracting our objects.
            - model.dart
    - /modules
        - /my_module
            - page.dart
            - controller.dart
	    - local_widget/
	# Here we create all local widget's of specefic pages

    - /global_widgets 
    # Widgets that can be reused by multiple **modules**.  

    - /routes
        - routes.dart
        # class Routes { const HOME = '/ home'; }  
        - pages.dart
        # class AppPages { static final pages = [  
        #  GetPage(name: Routes.HOME, page:()=> HomePage()) 
        # ]};  
    - /core
        - /values
	# Here we store all colors / strings and dimens
        - /theme
        # Here we can create themes for our app
        - /utils
        # Here you can insert utilities for your application, such as masks, form keys or widgets
	- exports.dart
	#Export all required file into one file (like material.dart :D)
- dependency_injection.dart
# inject all required dependencies in this file

- main.dart  
# main file
```

----

# Showcase

<p align="center">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/1.png" width="120"> <img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/2.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/3.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/4.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/5.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/6.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/7.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/8.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/9.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/10.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/11.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/12.png" width="120">
<img src="https://raw.githubusercontent.com/mahmoud-eslami/barber_booking/master/screen_shots/13.png" width="120">
</p>



## Next changes :

☑️ Add Firestore structure to the document

☑️ Add ability to add comment for each story

----

# Thanks for all supports 🙏🏻

