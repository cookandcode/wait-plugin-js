Plugin wait (JS)
==============

<p> This plugin is useful to use wait box during your ajax request for example </p>

## What you nedd
- [JQuery](http://jquery.com/)


## How do you use it ?

If you want show the wait box, you must choose in what part of your html you want to show this box :

```javascript
	$('body').wait({
		state:'begin'
	})
````

Here, I show the box in the body but you can chose a specific tag.

If you don't put an other piece of code, the box will not disapear !
So, write this code to hide the box :

```javascript
	$('body').wait({
		state:'end'
	})
````

Also, you can change the message which appear like this :
```javascript
	$('body').wait({
		state:'begin',
		message:'my_message'
	})
````

And, if you want add a timeout to hide the box, it's possible with this code :
```javascript
	$('body').wait({
		state:'show_message',
		message:'my_message',
		time_out:5000
	})
````

Here, the box will disapear after 5 seconds !


## Demo 
You can see a demo just [Here](http://demo.lemalesaint.fr/wait_plugin/demo/)