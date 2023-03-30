from random import *
import time
import datetime 
from datetime import timedelta

tab_rating=[]
emprunts = {}
rating = {}

mails=[]
query ="INSERT INTO `BORROW` (`ID_BORROW`,`ID_USER`,`ID_BOOK`, `START_DATE`,`END_DATE`) \n VALUES"
print(query)
personne=250 # nombre de user souhaitées
personne2=300 # nombre de user souhaitées
personne3=350 # nombre de user souhaitées
personne4=450 # nombre de user souhaitées
id=1

#Ajout d'emprunt de plusieurs livres pour plusieurs personnes

for index in range(2,personne):
    id_user=index # on choisit un id_user
    for index2 in range(1,5):
        string_occurence=""
        string_rating=""
        id_book=randint(1,230) # on choisit un id_book au hasard
        
        if id_book in rating:
            rated = False
            for rate in rating[id_book]:
                if rate["id_user"] == id_user:
                    rated = True
                    break
            
            if not rated:
                rating[id_book].append({"id_user": id_user})
                string_rating = "("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
                tab_rating.append(string_rating)

        else:
            rating[id_book] = [{"id_user": id_user}]
            string_rating = "("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
            tab_rating.append(string_rating)
        
        
        if id_book in emprunts:
            while True:
                # Générer une nouvelle date de fin d'emprunt
                now = datetime.date(randint(2019,2022),randint(1,12),randint(1,28))
                other_day_after = now + datetime.timedelta(randint(2,10))
                end_date=other_day_after.strftime("%Y-%m-%d")
                
                # Vérifier si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt
                chevauchement = False
                for emprunt in emprunts[id_book]:
                    if (now <= emprunt["end_date"]) and (other_day_after >= emprunt["start_date"]):
                        chevauchement = True
                        break
                
                if not chevauchement:
                    # Si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt, mettre à jour les informations d'emprunt pour ce livre
                    emprunts[id_book].append({"start_date": now, "end_date": other_day_after})
                    break
        else:
            # Si le livre n'est pas déjà emprunté, ajouter les informations d'emprunt pour ce livre
            now = datetime.date(randint(2019,2022),randint(1,12),randint(1,28))
            other_day_after = now + datetime.timedelta(randint(2,10))
            end_date=other_day_after.strftime("%Y-%m-%d")
            emprunts[id_book] = [{"start_date": now, "end_date": other_day_after}]

        # Ajouter les informations d'emprunt pour ce livre à la requête SQL
        start_date= now.strftime("%Y-%m-%d")
        string_occurence+=" ("+str(id)+","+str(id_user)+","+str(id_book)+",'"+start_date+"','"+end_date+"'"+")" 
        string_occurence+="," #sinon on ajoute une ","
        print(string_occurence)
        id+=1

# Ajouter plusieurs d'emprunt concernant plusieurs fois le même livre pour une même personne

for index3 in range(personne, personne2):
    id_user=index3 # on choisit un id_user
    id_book=randint(1,230) # on choisit un id_book au hasard
    first_book=True
    for index4 in range(1,5):
        string_occurence=""
        string_rating=""

        if id_book in rating:
            rated = False
            for rate in rating[id_book]:
                if rate["id_user"] == id_user:
                    rated = True
                    break
            
            if not rated:
                rating[id_book].append({"id_user": id_user})
                string_rating = "("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
                tab_rating.append(string_rating)

        else:
            rating[id_book] = [{"id_user": id_user}]
            string_rating = "("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
            tab_rating.append(string_rating)


        if id_book in emprunts:
            while True:
                # Générer une nouvelle date de fin d'emprunt
                now = datetime.date(randint(2019,2022),randint(1,12),randint(1,28))
                other_day_after = now + datetime.timedelta(randint(2,10))
                end_date=other_day_after.strftime("%Y-%m-%d")
                
                # Vérifier si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt
                chevauchement = False
                for emprunt in emprunts[id_book]:
                    if (now <= emprunt["end_date"]) and (other_day_after >= emprunt["start_date"]):
                        chevauchement = True
                        break
                
                if not chevauchement:
                    # Si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt, mettre à jour les informations d'emprunt pour ce livre
                    emprunts[id_book].append({"start_date": now, "end_date": other_day_after})
                    break
        else:
            # Si le livre n'est pas déjà emprunté, ajouter les informations d'emprunt pour ce livre
            now = datetime.date(randint(2019,2022),randint(1,12),randint(1,28))
            other_day_after = now + datetime.timedelta(randint(2,10))
            end_date=other_day_after.strftime("%Y-%m-%d")
            emprunts[id_book] = [{"start_date": now, "end_date": other_day_after}]
        
        # Ajouter les informations d'emprunt pour ce livre à la requête SQL
        start_date= now.strftime("%Y-%m-%d")
        string_occurence+=" ("+str(id)+","+str(id_user)+","+str(id_book)+",'"+start_date+"','"+end_date+"'"+")" 
        string_occurence+="," #sinon on ajoute une ","
        print(string_occurence)
        id+=1
    
# Ajout d'emprunts sans date de fin

for index5 in range(personne2,personne3):
    id_user=index5 # on choisit un id_user
    for index6 in (1,3):
        string_occurence=""
        string_rating=""
        id_book=randint(1,230) # on choisit un id_book au hasard
        
        if id_book in rating:
            rated = False
            for rate in rating[id_book]:
                if rate["id_user"] == id_user:
                    rated = True
                    break
            
            if not rated:
                rating[id_book].append({"id_user": id_user})
                string_rating = "("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
                tab_rating.append(string_rating)

        else:
            rating[id_book] = [{"id_user": id_user}]
            string_rating = "("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
            tab_rating.append(string_rating)
        
        
        if id_book in emprunts:
            while True:
                # Générer une nouvelle date de fin d'emprunt
                now = datetime.date(2023,randint(1,3),randint(1,28))
                other_day_after = now + datetime.timedelta(randint(2,10))
                end_date=other_day_after.strftime("%Y-%m-%d")
                
                # Vérifier si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt
                chevauchement = False
                for emprunt in emprunts[id_book]:
                    if (now <= emprunt["end_date"]) and (other_day_after >= emprunt["start_date"]):
                        chevauchement = True
                        break
                
                if not chevauchement:
                    # Si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt, mettre à jour les informations d'emprunt pour ce livre
                    emprunts[id_book].append({"start_date": now, "end_date": other_day_after})
                    break
        else:
            # Si le livre n'est pas déjà emprunté, ajouter les informations d'emprunt pour ce livre
            now = datetime.date(2023,randint(1,3),randint(1,28))
            other_day_after = now + datetime.timedelta(randint(2,10))
            end_date=other_day_after.strftime("%Y-%m-%d")
            emprunts[id_book] = [{"start_date": now, "end_date": other_day_after}]
        
        # Ajouter les informations d'emprunt pour ce livre à la requête SQL
        start_date= now.strftime("%Y-%m-%d")
        end_date='NULL'
        string_occurence+=" ("+str(id)+","+str(id_user)+","+str(id_book)+",'"+start_date+"', "+end_date+")"
        string_occurence+="," #sinon on ajoute une ","
        print(string_occurence)
        id+=1

# Ajout d'un emprunt pour un livre

for index7 in range(personne3,personne4):
    id_user=index7 # on choisit un id_user
    string_occurence=""
    id_book=randint(1,230) # on choisit un id_book au hasard
    
    if id_book in rating:
        rated = False
        for rate in rating[id_book]:
            if rate["id_user"] == id_user:
                rated = True
                break
        
        if not rated:
            rating[id_book].append({"id_user": id_user})
            string_rating = "("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
            tab_rating.append(string_rating)

    else:
        rating[id_book] = [{"id_user": id_user}]
        string_rating = "("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
        tab_rating.append(string_rating)
    
    if id_book in emprunts:
        while True:
            # Générer une nouvelle date de fin d'emprunt
            now = datetime.date(randint(2019,2022),randint(1,12),randint(1,28))
            other_day_after = now + datetime.timedelta(randint(2,10))
            end_date=other_day_after.strftime("%Y-%m-%d")
            
            # Vérifier si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt
            chevauchement = False
            for emprunt in emprunts[id_book]:
                if (now <= emprunt["end_date"]) and (other_day_after >= emprunt["start_date"]):
                    chevauchement = True
                    break
            
            if not chevauchement:
                # Si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt, mettre à jour les informations d'emprunt pour ce livre
                emprunts[id_book].append({"start_date": now, "end_date": other_day_after})
                break
    else:
        # Si le livre n'est pas déjà emprunté, ajouter les informations d'emprunt pour ce livre
        now = datetime.date(randint(2019,2022),randint(1,12),randint(1,28))
        other_day_after = now + datetime.timedelta(randint(2,10))
        end_date=other_day_after.strftime("%Y-%m-%d")
        emprunts[id_book] = [{"start_date": now, "end_date": other_day_after}]
    
    # Ajouter les informations d'emprunt pour ce livre à la requête SQL
    start_date= now.strftime("%Y-%m-%d")
    string_occurence+=" ("+str(id)+","+str(id_user)+","+str(id_book)+",'"+start_date+"','"+end_date+"'"+")"
    string_occurence+="," #sinon on ajoute une ","
    print(string_occurence)
    id+=1

# Ajout ligne final

id_user=450 # on choisit un id_user
string_occurence=""
id_book=randint(1,230) # on choisit un id_book au hasard
if id_book in emprunts:
    while True:
        # Générer une nouvelle date de fin d'emprunt
        now = datetime.date(randint(2019,2022),randint(1,12),randint(1,28))
        other_day_after = now + datetime.timedelta(randint(2,10))
        end_date=other_day_after.strftime("%Y-%m-%d")
        
        # Vérifier si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt
        chevauchement = False
        for emprunt in emprunts[id_book]:
            if (now <= emprunt["end_date"]) and (other_day_after >= emprunt["start_date"]):
                chevauchement = True
                break
        
        if not chevauchement:
            # Si la nouvelle date de fin d'emprunt ne chevauche pas un autre emprunt, mettre à jour les informations d'emprunt pour ce livre
            emprunts[id_book].append({"start_date": now, "end_date": other_day_after})
            break
else:
    # Si le livre n'est pas déjà emprunté, ajouter les informations d'emprunt pour ce livre
    now = datetime.date(randint(2019,2022),randint(1,12),randint(1,28))
    other_day_after = now + datetime.timedelta(randint(2,10))
    end_date=other_day_after.strftime("%Y-%m-%d")
    emprunts[id_book] = [{"start_date": now, "end_date": other_day_after}]

# Ajouter les informations d'emprunt pour ce livre à la requête SQL
start_date= now.strftime("%Y-%m-%d")
string_occurence+=" ("+str(id)+","+str(id_user)+","+str(id_book)+",'"+start_date+"','"+end_date+"'"+")"
string_rating = " ("+str(id_user)+","+str(id_book)+","+str(randint(0,5))+")"
tab_rating.append(string_rating)
string_occurence+=";" #sinon on ajoute une ","
print(string_occurence)
id+=1


#on lance la commande python3 scriptBorrow.py > borrow.sql
print("\n")

# Ajout Rating
query2 = "INSERT INTO `RATING` (`ID_USER`,`ID_BOOK`,`rate`) \n VALUES"
print(query2)
for i in range(len(tab_rating)):
    # si c'est le dernier on enlève la virgule
    if i == len(tab_rating)-1:
        print(tab_rating[i]+";")
    else:
        print(tab_rating[i]+",")
print("\n")