from random import *
import datetime,timedelta

mails=[]
query ="INSERT INTO `BORROW` (`ID_BORROW`,`ID_USER`,`ID_BOOK`, `START_DATE`,`END_DATE`) \n VALUES"
print(query)
occurence=500 # nombre de ligne souhaitées
for index in range(1,occurence):
    string_occurence=""
    id=index
    id_user=index
    id_book=randint(1,60) 
    now = datetime.datetime.now()
    start_date= now.strftime("%Y-%m-%d")#date du jour 
    other_day_after = now + datetime.timedelta(randint(2,10)) # date de rendu comprise entre 2 et 10 jours apres la date du jour
    end_date=other_day_after.strftime("%Y-%m-%d")
    string_occurence+=" ("+str(id)+","+str(id_user)+","+str(id_book)+",'"+start_date+"','"+end_date+"'"+")" 
    if(index==occurence-1):string_occurence+=";" # si on est à la derniere ligne on ajoute un ";"
    else: string_occurence+="," #sinon on ajoute une ","
    print(string_occurence)

#on lance la commande python3 scriptBorrow.py > borrow.sql