import json
def get_key(val,dict):
    for key, value in dict.items():
        if val == value:
            return key
f = open('livres.json', encoding="utf8")
data = json.load(f)
tabAuteur = {}
cpt=0
tabGenre = {}
cptGenre=0
for i in range(len(data['items'])):
    if 'authors' in data['items'][i]['volumeInfo']:
        for j in range(len(data['items'][i]['volumeInfo']['authors'])):
            if(data['items'][i]['volumeInfo']['authors'][j] not in tabAuteur.keys()):
                cpt+=1
                tabAuteur[data['items'][i]['volumeInfo']['authors'][j]]=cpt
    if 'categories' in data['items'][i]['volumeInfo']:
        for l in range(len(data['items'][i]['volumeInfo']['categories'])):
            if(data['items'][i]['volumeInfo']['categories'][l] not in tabGenre.keys()):
                cptGenre+=1
                tabGenre[data['items'][i]['volumeInfo']['categories'][l]]=cptGenre
remplirNomAuteur = open('remplirNomAuteur.sql','a',encoding="utf8")
remplirNomAuteur.write("INSERT INTO `AUTHOR` (`ID_AUTHOR`,`AUTHOR_NAME`) VALUES \n")
for i in range(len(tabAuteur)):
    if i == len(tabAuteur)-1:
        nom = str(get_key(i+1,tabAuteur))
        nom = nom.replace("'"," ")
        remplirNomAuteur.write("("+str(i+1)+",'"+nom+"');\n")
    else:
        nom = str(get_key(i+1,tabAuteur))
        nom = nom.replace("'"," ")
        remplirNomAuteur.write("("+str(i+1)+",'"+nom+"'),\n")
remplirTag = open('remplirTag.sql','a',encoding="utf8")
remplirTag.write("INSERT INTO `TAG` (`ID_BOOK`,`ID_CATEGORY`) VALUES \n")
remplirGenre = open('remplirGenre.sql','a',encoding="utf8")
remplirGenre.write("INSERT INTO `CATEGORY` (`ID_CATEGORY`,`CATEGORY_NAME`) VALUES \n")
for i in range(len(tabGenre)):
    remplirGenre.write("("+str(i)+",'"+str(get_key(i+1,tabGenre))+"'),\n")
remplirGenre.write("("+str(len(tabGenre))+",'Sans categorie');")
remplirLangue = open('remplirLangue.sql','a',encoding="utf8")
remplirLangue.write("INSERT INTO `LANGUAGE` (`ID_LANGUAGE`, `LIB_LANGUAGE`) VALUES \n (1,'fr'), \n (2,'en'), \n (3,'it'), \n (4,'de'), \n (5,'sv');")
remplirAuteurs = open('remplirAuteurs.sql','a',encoding="utf8")
remplirAuteurs.write("INSERT INTO `WRITE` (`ID_AUTHOR`,`ID_BOOK`) VALUES \n")
remplirLivres = open('remplirLivres.sql','a',encoding="utf8")
remplirLivres.write("INSERT INTO `BOOK` (`ID_BOOK`,`ID_LANGUAGE`, `TITLE`, `IMAGE`, `DESCRIPTION`,`NUMBER_OF_PAGES`, `EDITOR`, `RELEASE_DATE`) VALUES \n")
for i in range(len(data['items'])-1):
    if 'authors' in data['items'][i]['volumeInfo']:
        for j in range(len(data['items'][i]['volumeInfo']['authors'])):
            if i==len(data['items'])-1:
                remplirAuteurs.write('('+str(tabAuteur[data['items'][i]['volumeInfo']['authors'][j]])+', '+str(i+1)+');\n')
            else:
                remplirAuteurs.write('('+str(tabAuteur[data['items'][i]['volumeInfo']['authors'][j]])+', '+str(i+1)+'),\n')
    if 'categories' in data['items'][i]['volumeInfo']:
        for j in range(len(data['items'][i]['volumeInfo']['categories'])):
            if i==len(data['items'])-1:
                remplirTag.write('('+str(i+1)+', '+str(tabGenre[data['items'][i]['volumeInfo']['categories'][j]])+');\n')
            else:
                remplirTag.write('('+str(i+1)+', '+str(tabGenre[data['items'][i]['volumeInfo']['categories'][j]])+'),\n')
    else:
        if i==len(data['items'])-1:
            remplirTag.write("("+str(i+1)+", "+str(len(tabGenre))+");\n")
        else:
            remplirTag.write("("+str(i+1)+","+str(len(tabGenre))+"),\n")
    remplirLivres.write('('+str(i)+", ")
    if(data['items'][i]['volumeInfo']['language']=='fr'):
        remplirLivres.write(str(1)+', ')
    elif(data['items'][i]['volumeInfo']['language']=='en'):
        remplirLivres.write(str(2)+', ')
    elif(data['items'][i]['volumeInfo']['language']=='it'):
        remplirLivres.write(str(3)+', ')
    elif(data['items'][i]['volumeInfo']['language']=='de'):
        remplirLivres.write(str(4)+', ')
    elif(data['items'][i]['volumeInfo']['language']=='sv'):
        remplirLivres.write(str(5)+', ')
    titre = data['items'][i]['volumeInfo']['title']
    titre = titre.replace("'", " ")
    remplirLivres.write("'"+titre+"', ")
    if 'imageLinks' in data['items'][i]['volumeInfo']:
        img=data['items'][i]['volumeInfo']['imageLinks']['smallThumbnail']
        remplirLivres.write('\''+img+'\', ')
    else:
        remplirLivres.write('NULL, ')
    if 'description' in data['items'][i]['volumeInfo']:
        desc = data['items'][i]['volumeInfo']['description']
        desc = desc.replace("'"," ")
        remplirLivres.write('\''+desc+'\', ')
    else:
        remplirLivres.write('NULL, ')
    if 'pageCount' in data['items'][i]['volumeInfo']:
        pages = str(data['items'][i]['volumeInfo']['pageCount'])
        remplirLivres.write(pages+', ')
    else:
        remplirLivres.write('NULL, ')
    if 'publisher' in data['items'][i]['volumeInfo']:
        publisher = data['items'][i]['volumeInfo']['publisher']
        publisher = publisher.replace("'"," ")
        if i==len(data['items'])-1:
            remplirLivres.write('\''+publisher + '\',')
        else:
            remplirLivres.write('\''+publisher + '\',')
    else:
        if i==len(data['items'])-1:
            remplirLivres.write('NULL );')
        else:
            remplirLivres.write('NULL ),')
    if 'publishedDate' in data['items'][i]['volumeInfo']:
        publisherDate = data['items'][i]['volumeInfo']['publishedDate']
        publisherDate = publisherDate.replace("'"," ")
        if i==len(data['items'])-1:
            remplirLivres.write('\''+publisherDate + '\'); \n')
        else:
            remplirLivres.write('\''+publisherDate + '\'), \n')
remplirLivres.close()
remplirGenre.close()
remplirAuteurs.close()
remplirLangue.close()
remplirNomAuteur.close()
