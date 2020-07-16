# Speech notes

# Part I
========

Bonjour,

Je m'appele JBL, nous avons un créneau d'1h30 devant nous pour cette présentation.

## Presentation Plan

La présentation se fera en français, en 3 parties

* Une première partie classic d'introduction pour me présenter, ainsi les personnes qui m'encadrerons pendant ce projet, l'objective de la présentation et une parenthèse sur quelques définitions pour pouvoir que je sois le plus clair possible.

* La partie principale avec laquelle je vais illustrer le model actuelle, là où il nous limite en ce moment et introduire une opportunité pour en développer un nouveau qui nous permettrait d'avancer. 

Lorsque je parle de model je regroupe l'intégralité du système embarqué sur un véhicule. Cela va de pièce comme le système ABS, ou système d'infotainement au niveau du cockpit et de la plage arrière. (Cockpit aid unit, IVI, RSE)

Je tiendrais compte autant que possible de tous ces éléments le long de cette partie mais en restant au niveau de l'architecture et du design.

C'est la partie la plus rempli, c'est là dessus que je vais m'attarder le plus.

* La dernière partie est plus simple, j'y présenterai le format du projet de recherche et des détails plus administratif.

Si il vous manque du sommeil, je recommend d'être le plus attentif pour la second partie.

## Introduction and abstract

Donc, commençons !

## Presenting myself first

Je m'appele JBL. Cela doit maintenant bien faire plus de 6 mois que je travaille ici. J'étais au rez-de-chausser dans l'équipe the Yoan sur le développement de la platform RAPIDE.

Avant ça, je travaillais dans le secteur de l'enseignement en grandes écoles, et en Cyber-securité. J'y ai fait une recherche en analyse static de code compilé, un audit mais surtout de la veille, de la rétro-ingénieurie, et du développement de solution de sécurité pour des grands comptes.

Le milieu de la sécurité est bien différent de l'automobile et pour dire vrai ça fait du bien de de changer d'horizon pour voir du nouveau, et surtout continuer à progresser.

A l'heure actuelle, je travail exclusivement sur ce début de projet de recherche que je vais vous présenter. Si tous ce passe bien, ce projet sera mon sujet de doctorat pour ces 3 prochaines années, et j'entends bien le réussir.

## Involved parties

Ce doctorat impliquera Julien et Bruno. Julien est déjà de la maison, il prend de son temps pour m'encadrer et m'aider sur ma recherche. Je souhaite l'en remercier un peu en avance de projet.

Bruno sera mon contact du côté de L'ENSTA Paris tech, il enseigne la bas et me soutient autant avec ses connaissances dans l'automobile, que sur son experience en suivi de thèse. Je ne suis pas le premier qu'il encadre. A moins de me tromper Bruno à été le maître de thèse de Julien.

Il y a d'autres personnes impliquées plus indirectement sur le projet mais cela fera l'object d'un autre moment.

## Objective of the presentation

Mon objective maintenant serait de vous présenter un premier résultat de mon travail de réflexion, et du potentiel que ce projet aurait sur ces 3 ans pour Faurecia.

Ce qui vous interessera aura pour horizon ma mi-thèse, c'est à dire à la mi, fin 2021 pour les premiers prototypes si l'on est optimiste.

Un autre objective pour moi serait de pouvoir faire connaissance avec vous. Je suis je pense le plus jeune ici et n'ai pas encore eu l'occasion de partager. Je suis convaincu que il y aurait des choses à y faire.

## Definitions and wording.

Juste avant de démarrer la partie velue, poser quelques mots de vocabulaire pour que je sois certain d'être en accord avec tous le monde.

# Part II
==========

Nous y voila.

## Reminder of the main constraints

Pour introduire, je vais rappeler les contraintes principales qui tournent autour du model de l'embarquer dans l'automobile. J'ai gardé celle qui vont nous impacter le plus, entre autre:

* La sécurity, qui pour des raisons assez évidente est plus que critique. Elle dirige la plupart des travaux et oriente, ou contraint une large portion des choix technologiques fait en développement et design.

* La partie légal concerne les organismes de régulation, et certification, qui seraient applicable sur le model  et ses pièces. Contrairement à la "safety", cette contrainte est délimité et connu. Ce qui est une bonne chose.

Je pense ici à des contraintes orientés autour du respect des données utilisateurs dans un monde de plus en plus connecté.

* Enfin, le coût et le TTM sont malgrés eux deux classics.

Je parlerai de ces 4 points à plusieurs reprises pour appuyer certain choix et modifications techniques.

## Model explanation 

Pour démarrer progressivement, nous avons un system embarqué. C'est la platforme logiciel principale développé par les fabricants. C'est elle qui se chargera de gérer toutes les briques externes à la manière d'un kernel.

## A brief, brief model representation

Par dessus ce système viennent s'en joindre d'autre, plus petit mais spécialisé sur leurs tâches. Dans notre cas de figure ils sont associés presque systématiquement à une unité de contrôle branché physiquement sur le véhicule.

J'ai pris 3 exemples de sous-systèmes parlant pour illustrer, comme la gestion du moteur, l'injection du carburant ou le système de freinage.

## External parties, 1 / 2

Les premiers acteurs, et les plus directement impliqués sont les OEMs qui fournissent ce logiciel spécialisé nécéssaire pour le matériel embarqué.

C'est avec eux que la fabricant automobile vont devoir communiquer, échanger et travailler de concert, et ce tout le long du cycle de design et de développement de part la composante logiciel incluse dans le composant pour son intégration.

Toutefois les OEMs ne sont pas en charge de l'intégralité du composant.

## External parties, 2 / 2

Les OEMs viennent se fournir en matériel auprès de constructeurs capable d'assurer une production plus classique en usine. De ce point de vue les OEMs travaillent le produit construit ce qui permet l'intégration complète de la pièce dans le systèmes principale du fabricant.


## Afterthought

Nous allons maintenant attaquer la partie sur les problèmes du model. 

## First issues

Les OEMs et les constructeurs sont tout'deux des acteurs externes sur lesquelles les fabricants doivent s'appuyer. Je ne connais pas d'alternatives à ce besoin de sous-traitance actuellement.

La sous-traitance ne pose en général pas de problèmes et accélère la mise en production, même si elle vient avec son lot d'inconvéniant comme sont surcoût,

Dans une moindre mesure le besoin de faire confiance sur la qualité du livrable est aussi un problème en lui même, mais c'est surtout que la sous-traitance impose son lot d'effort dépensé en communication.

Enfin, c'est aussi une source d'inconnu. Si jamais le produit demandé subit des délays, parfois déclarées tardivement sur une pièce importante, cela peux entrainer des dérives en cascade. Plus le nombre d'acteur sur le chaine augmente, et plus ce risque de dépasser une deadline augmente.

## It's not the end, the real issues are

En tout cas ce sont des choses avec lesquelles l'on apprends à travailler malgré tous, et en général la praticité de cette sous-traitance est nécéssaire pour des raisons d'expertise ou de moyens immédiant manquant.

Là où cela devient plus compliqué, c'est lorsque un autre petit détails vient appuyer le sujet. Dans notre cas ce serait la multiplication des composants présent sur une voiture. Les véhicules sur le marché tendent à devenir de plus en plus complexe.

Nous avons l'arrivé des véhicules electrique, l'arrivés des systems connectés, et un attrait pour des interfaces electroniques plus complètes côté passagé (IVI, RSE)

## Cars become more and more complex

Plus de complexité veut dire plus de pièces à commandé, plus d'entreprise sous-traitante à gérer, et plus de gestion.

## Current model example issue 

### Stage 1 / 3
J'ai pris l'exemple des sous-systems pour illustrer mes propos. Sur le model actuel tout les sous-systems sont sur le même niveau hiérarchique, sans organisation ou regroupement particulier.

Lorsque cet architecture logiciel est soumise à un faible nombre de compostant le problème ne se pose pas, et est même un bon choix technique puisque il est d'une simplicité assez direct.

### Stage 2 / 3

Mais quelques éléments de plus suffisent pour que le problème se prononce d'avantage

### Stage 3 / 3

Et en bout de chaine la situation devient intenable. Il faut essayer de mettre ce schema non pas en contrast sur une communication inter sous-systems, mais sur une communication d'une entreprise à plusieurs autres, plus petite, et indépendante. De la même façon que gérer un chantier de construction, et coordonner un ou deux artisants malgré des corps de metier différents est faisable, cet opération devient vite difficule lorsque seule il faut en gérer une autre dizaine.

### A parenthesis on a published standard

AUTOSAR par exemple à établi des designs pour faire face à cet complexité explosive.

AUTOSAR est un standard développé par un consortiom de fabricant pour normalisé et facilité le travail d'intégration et de mise en place du model.

Ils recommendent par exemple l'utilisation d'un réseau pour relier les sous-systems entre eux, et l'abstraction de composants au niveau logiciel pour faire face à la multiplication des interfaces spécialiser à supporter.

### Technical solutions do exists, yet

Malgrés tous, des solutions comme AUTOSAR sont soumise à une license.

La nature même du model actuelle, a propos de la très forte imbrication de chaque parties entre elles, nécéssite chaque acteur de la chaine à s'en acquiter.

Si le fabricant décide de se soumettre au design AUTOSAR, même partiellement, alors les OEMs concerné par cet partie du model devront également acquérir une license pour avoir le droit d'utiliser le code nécéssaire à la communication entre l'ECU qu'il sous-traite, et le code en bout de chaine du fabricant.

Pour simplifier sur les coûts: si le fabricant décide d'utiliser une license propriétaire, alors il devra payer cette license, il devra payer une marge sur le livrage fourni par l'OEM pour couvrir ses propres frais de license, et enfin il devra payer une 3e fois ce surplus sur l'ECU transmise par le constructeur à l'OEM.

Pour clore la parenthèse, même si beaucoup de problème sont adréssé, le fabricant se devra de travailler et de communiquer avec chaque OEMs aussi longtemps que le nombre de composant sous-traité sera important.

### Other limitations do exist

Le problème de complexité que j'ai présenté n'est pas nouveau. Une voiture est un system qui est complèxe et contraint.

Une des conséquences que j'ai pu constater plus personnelement cette fois ci, et qui touche les équipes de développement aussi bien du côté fabricant que du côté des OEMs.

Il devient très difficile de faire même de petit ajout de fonctionnalité. Je vais prendre l'exemple d'un OEM à qui l'on demande une modification pour que un passager puisse regarder une vidéo à l'arrière du véhicule. Et bien cette demande va nécéssite une prise en compte de la taille des sièges, la luminosité de l'écran, de quelles connectiques le véhicule est équipé, ou se trouve les organes de sons, est ce que le sous-system vidéo doit passer par le model du fabricant pour s'en servir ? est ce que la vidéo devra être lu depuis le cloud, une clef USB, les deux peut être ?

Il y a ce besoin d'expertise pour connaitre toute les couches basses du systemes qui est important. Android, la couche basse du system, les API des ECUs, parfois même la messagerie interne des ECU.

Un dernière exemple: si l'on souhaite remonter une erreur très simple, comme une erreur sur une clef USB mal branché au niveau du controller. Il faut traverser toute, les, couches du système jusqu'a l'affichage graphique pour dire au conducteur que quelque chose ne va pas.

L'on parle ici de 4, 5, parfois 6 niveau de complexité imbriqué à maitriser. C'est jouable, mais il faut parfois s'accrocher.

Concernant les OEMs, cela veut dire aussi que c'est un cout en temps qui va se chiffrer non seulement sur la validation du livrable, mais qui va devoir se tenir sur toute les étapes d'un cycle en V, de sa conception design à la maintenance post production. La demande contient parfois trop d'inconnu ou de sur-mesure pour tenir sur le respect d'une interface logiciel.

## Break n°2, before presenting the new model
## Introduction to the concept model

Pour remettre en context: nous venons de voir un exemple de système performant et fonctionnel mais qui tend à devenir contraignant.

Ce model convient, et à convenu très bien à un design final avec une quantité de composants controlés et surtout faible si l'on souhaite éviter cette complexité.

## Incremental list of modifications
#### Appropriation of sub-systems

Pour ça, le nouveau model reposerait d'abort sur une première modification majeur. S'approprier, et de prendre à la charge du fabricant directement les sous-systems.

C'est une étape importante avec un cout d'entrée sur le travail de design qui demandera du temps.

A ce stade, le role des OEMs sera très réduit et les fabricants ne devront plus que communiquer auprès des constructeurs, modulo une demande d'API bare-bone pour utiliser la pièce matériel. 

Cette étape permettrait de supprimer une couche de complexité, l'important besoin de communication tout au long du projet, mais surtout de faciliter la communication inter sous-systems et de pouvoir proposer une gestion de la complexité avec toute les cartes en main.

<!-- Question: can't this be done with OEMs ? -->

#### Isolation of every components

Ce premier changement de design nous permet d'avoir la main libre sur cette flotte de composants. La seconde modification serait d'ajouter un niveau de cloison en nous servant de machines virtuelles.

Cloisoner, abstraire, et hiérarchisé des compostnats pour bénéficier de plus de modularité n'a rien de nouveau. La nuance ici vient de la profondeur sur laquel cette virtualization s'applique.

Un design classique tendrait à virtualizer les couches hautes, au niveau du système d'exploitation ou juste en dessous.

L'idée que j'ai de ce projet serait d'étudier ce qui serait possible en appliquant ce procédé beaucoup plus bas, sur le squelette même du model.

Par exemple le gestionnaire de communication, en charge d'établir l'API inter modules et gérer leur enregistrement au traver d'un bus pourrait être interchangé de la même façon que l'on change une application sur un système android. D'autres ECUs présent en dehors des systems principaux pourrait être interchangés.

Ce niveau de modularité sera difficile à concevoir, mais si la recherche à venir amène de bon résultats cette abstraction apporterait une plus valus non-négligeable. Il permettrait aussi de s'abstraire du licensing AUTOSAR. Si ce dernier est cantoné à des machines interchangeable, la license s'appliquerait uniquement sur les produits voué à être compatible.

Il y a des précédents dans l'industry sur comment travailler proprement autour d'une license contagieuse tel que GPL pour des bibliothèques de développement linux. A grand renfort de cloisonement IPCs et d'adaptateur certe mais parfaitement possible avec ce model de virtualization bas niveau.

Il a un autre aspect de la virtualisation que je souhaiterai présenter. Ce niveau de virtualisation offre un moyen de configurer, de rendre dynamique l'intercheangabilité de composants figé par design, la possibilité de faire de la répartition de charge à la volée voir peut être de développer un gestionnaire de machine virtuelle central pour travailler avec ces flottes de VMs.

Dans tous les cas, la virtualisation nous permettra en plus d'être flexible de nous abstraire des couches basses. Si le code tourne sur une architecture virtualisée il devient possible de simplifier les ECUs et d'en développer une nouvelle game qui soit plus générique. Cela réduirait du même coup le nombre de pièces spécialisés nécéssaire, et la complexité global du system.

--

<!-- Il manque qqchose: un point sur la gestion de la virtualisation (capacité à configurer, le rendre dynamique, être en mesure d'avoir un gestionnaire de VM (system de micro gestion des VMs déployé)). Par contre, la force est le rendre assez souple pour qu'il soit adaptable dynamiquement, fgérer le load balancing, mais un system de gestion de facilement configurer et gérer est très original. -->

<!-- Regarder les IOT (kubernetest / docker), gestion de park de machine virtuel a la demande, au moment du calcul. -->
<!-- Julien connait un des fondateur de kubernetest, mais plus chez eux (maintenance chez Appel. -->

<!-- (Julien avait travailler chez les télécom, verticalisation des systems, bay. Replacement de bay physique par des bay logiciels. Le passage de 1 à N dynamiquement. Démrrer, charger, configurer pour répondre à la charge. System expert ? IA ? Qui évalue l'importance du calclu ?) -->

<!-- A term, pourquoi pas un véhicule avec un system central qui ordone, et un ensemble d'ECU générique un peu partout, redondance en cas de problème ou nominal spécifique. -->

<!-- PArtie 3: Retirer l'uml timeline (faire un tour d'horizon, mettre de jalons validation, prototype, le cadrer pour avoir du résultats). L'on part sur un horizon connu + lien bibliographique, le raccord entre mon travail de recherche, et le travail Faurecia. Je vais avoir des phases de prototypage sur des produits Faurecia (pure innovation, ou réponse RFI). Donner un cadre à mon travail. -->

## Further investigation to do on virtualization.

Une dernière slide pour clore cet partie technique, la suite est plus légère.

La virtualisation est une technologie qui à depuis longtemps dépassée le stade expérimental. Elle est déjà bien présente dans l'industry comme le secteur des télécoms, les hébergeurs ou les clusters de calculs.

Malgré tout elle l'est assez peu sur les couches basses du model automobile et certaines questions devront se poser. Est ce que cet encapsulation nous permettra toujours de tenir des delays sérés sur un système temps réel ? ou est ce qu'il sera possible de le rendre facilement configurable ?

Je serais amené à voir ça rapidement pendant ma première phase de recherche sur le projet. Esperons pour le meilleur.

# Part III

(todo)

--

TODO: slides on virtualization direct benefit (out of time for that)
Année 70: serveur  réseau dans les grandes entreprises, télécome (80/90 avec le GSM et téléphone mobile) ou internet . Gross bay serbeur, couteux (renouvellement, besoin d'expertise, en energy). Un mouvement: comment remplacer des bays serveurs physique par du logiciel ou virtuel. (1 serveur par 1 VM qui fait tourner un soft, dédier. IBM ?). Ensuite dans la logic, 1 machine physique, qui fait tourner un logicier de virtu, qui fait tourner 1 bay. Plus besoin d'avoir du spécifique (juste du codage you configuration). Et les machines se scales, et évolue plus facilement (étendre la ram avec une nouvelle barette, disque, etc). Le parrallélisme est une forme de paradigme ou je reproduis la même cjose à l'automobile (de N ECU spécialisé, à un serveur de VM qui remplace les ECU physique. L'originaté est que je ne borne pas à tout centralisé (problème de safeté), et charger une VM sur un ECU distance, le généraliser, le rendre hors spécifique. Retrait de la spécialisation du matériel, ce qui induit une redondance puisque matériel similaire.
