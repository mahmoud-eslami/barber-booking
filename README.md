# 🔥🔥 Barber-shop booking 💇🏻‍♂️💇🏻


<img src="https://github.com/mahmoud-eslami/barber_booking/blob/master/screen_shots/MOCKUP-1.png" width="400"> <img src="https://github.com/mahmoud-eslami/barber_booking/blob/master/screen_shots/MOCKUP-2.png" width="400">


---

## Project / Folder structure :

```yaml
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

---

## Packages :
 #### state management :
- get: `^4.6.1`
 #### icon :
- cupertino_icons: `^1.0.2`
- ionicons: `^0.1.2`
 #### firebase :
 - firebase_auth: `^3.3.11`
 - firebase_core: `^1.13.1`
 - google_sign_in: `^5.2.4`
 - cloud_firestore: `^3.1.10`
 #### utils :
- dartz: `^0.10.1`
- intl: `^0.17.0`
 - camera: `^0.9.4+16`
 #### navigation system :
- get: `^4.6.1`
 #### responsive :
- auto_size_text: `^3.0.0`
 #### cache :
 - extended_image: `^6.0.2+1`
 #### location / map :
- flutter_map: `^0.14.0`
 - geolocator: `^8.2.0`


