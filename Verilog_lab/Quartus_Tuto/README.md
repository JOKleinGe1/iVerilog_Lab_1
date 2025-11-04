Tuto QARTUS : 
En résumé : 

Lancer quartus 
Dans quartus, créer un projet : (nom sans espace ni accent, board:DE10Lite) > Un fichier MyNewProject.qpf (Quartus Project File)
Déconnecter complétement les sorties non utilisées Sinon, les LED non utilisées seront allumées (faiblement)
Ajouter le fichier verilog (truc.v) contenant le module truc, (pas son testbench). 
Créer le symbole de votre design > Un fichier truc.bsf (bloc Symbol File) doit être créé. 
Créer un fichier schematic Top_Truc.bsf (Bloc diagram Schematic File) 
Y intégrer une instance de votre composant et connecter les entrées et sorties et leur donner les noms des entrées physiques 
Enregistrer le fichier => création d'un fichier Top_truc.bdf 
Ajuster le contenu du projet, y mettre votre truc.v et Top_Truc.bdf (retirer DE10Lite_GoldenTop)
Designer le module Top_Truc.v en tant que sommet de la hierarche 
Compiler le projet > Création du répertoire OutputFiles/MyNewProject.SOF,MyNewProject.POF
Connecter et programmer la carte 
C'est tout !
