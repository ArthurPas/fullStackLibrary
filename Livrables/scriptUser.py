import names
import random
import requests

mails=[]
query ="INSERT INTO USER (`ID_USER`,`FIRSTNAME`,`LASTNAME`, `EMAIL`,`PASSWORD`,`AVATAR`) \n VALUES"
occurence=500
print(query)
for index in range(1,occurence):
    string_occurence=""
    id_user=index
    firstName = names.get_first_name() #generation du prenom depuis names
    lastName = names.get_last_name() #generation du nom de famille depuis names
    req = requests.get("https://100k-faces.glitch.me/random-image-url") #recuperation d'une image aléatoire de personne
    wb = req.json() # conversion en json
    img = wb['url'] #extraction de l'url depuis le json
    email = firstName+"@gmail.com" # generation d'un email fictif depuis le prenom
    while(email in mails):
        email = firstName+str(random.randint(2, 100000))+"@gmail.com" # en cas de doublon on génère un nombre aleatoire jusqu'à ce que l'email ne soit pas dans la bd
    mails.append(email)
    password = firstName+"33" #password représente l'email
    string_occurence+=" ("+str(id_user)+",'"+firstName+"','"+lastName+"','"+email+"','"+password+"','"+img+"')" 
    if(index==occurence-1):string_occurence+=";" # si on est à la derniere ligne on ajoute un ";"
    else: string_occurence+="," #sinon on ajoute une ","
    print(string_occurence)

#on lance la commande python3 scriptUser.py > user.sql