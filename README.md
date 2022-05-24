# 🔥🔥 Barber-shop booking 💇🏻‍♂️💇🏻

This is a barber-shop booking platform . `Firebase 💛` as Backend service and `Flutter 💙` used as client technology.

<img src="https://github.com/mahmoud-eslami/barber_booking/blob/master/screen_shots/MOCKUP-1.png" width="400"> <img src="https://github.com/mahmoud-eslami/barber_booking/blob/master/screen_shots/MOCKUP-2.png" width="400">


---
## Firebase Firestore Structure :
```
barber 💇🏻‍♂️ ---
	---
	- description [String]
	- image [String]
	- location [String]
	- name [String]
barbershops 🏠 ---
	---
	- description [String]
	- endWorkTime [String]
	- id [String][documentId]
	- image [String]
	- lat [String]
	- long [String]
	- startWorkTime [String]
	- subTitle [String]
	- tags [List<String>]
	- title [String]
posts 🌁 ---
	---
	- description [String]
	- image [String]
	- releaseTime [String]
	- timeToRead [String]
	- title [String]
	- barber [barber document refrence]
story 🌃 ---
	---
	- comments [List<String>]
	- image [String]
	- id [String][documentId]
	- likes [List<String>]
	- seens [List<String>]
	- thumbnail [String]
users 🙋🏻‍♀️🙋🏻‍♂️ ---
	---
	- age [int]
	- gender [int]
	--- appointments ---
			- appointmentTime [String]
			- barberShop [barber shop document refrence]
			- id [String][documentId]
```

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
## Next changes : 

☑️ Add Firestore structure to the document

☑️ Add ability to add comment for each story

----
# Thanks for all supports 🙏🏻

