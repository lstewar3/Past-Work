#Lyle A. Stewart 
#This is the code to upload an JSON LIB THROUGH API to Python and create search query tool 


import urllib2
import json
# Import the Java Script Object Notation Library 

locu_api = '4fdab6d18222b7262f6c6c5c6b270d55d0a39703'
# Introduce the object variable locu_api and assign it the value which is equivalent to the API Key 
# This makes the code less messy

# Note that this number is the API key and was located in the URL 
# The api key may sometimes be listed seperately on the site that you are looking into pulling info from

def locu_search(query):
	api_key = locu_api
	url = 'https://api.locu.com/v1_0/venue/search/?api_key=' + api_key
	locality = query.replace(' ','%20') ### %20 from original API, ensures no spaces.
	final_url = url + "&locality=" + locality
	json_obj = urllib2.urlopen(final_url) ### random json object is going to open this URL 
	data = json.load(json_obj) ### if we print data, python will print the entire library 
	
	for item in data ['objects']: ### each item is now its own seperate library. Every list now has it's own library 
		print item ['name'], item['phone']
		
# Note that you have now created a search engine. You can at this point query the online data library to, given the library keys 
# Phone and name, (note that you can change these to other variablest that are listed in the API library) provide this information as relates to the location querried. 

