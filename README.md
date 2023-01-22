
title: tabmind
subtitle: Dokumentation
author: Mack,Graff, Schmidt
date: 17.07.2022
lang: de


## Einleitung
Tabmind soll eine einfache App für Erinnerungen an Tabletten sein. Warum braucht man überhaupt eine App dafür? Viele Menschen müssen täglich Medikamente nehmen, vergessen dies jedoch gelegentlich. Laut einer Studie werden etwa ein Drittel der verschrieben Medikamente nicht genommen[[SDZ]](#1).Dazu kommen Menschen, die Andere pflegen und sich auch um ihre Tabletten kümmern müssen. Die Hauptzielgruppen von Tabmind sind ältere Menschen, Pflegende sowie Frauen, die täglich die Pille nehmen. Für diese Zielgruppen wurden bestimmte Funktionalitäten überdacht und in die App integriert.
Profile sind dabei wichtig, um Pflegenden zu ermöglichen, den Überblick über mehrere Menschen zu behalten und genau zu überwachen, welche Tabletten von wem genommen werden müssen.
Für Frauen soll es eine Kalenderfunktionalität geben um den Überblick zu behalten, wie lange die Pille schon eingenommen wurde und wann die nächste Pause ist.
Somit gibt es insgesamt 6 Pages, die die App bereitstellen muss. Die Homepage ermöglicht einen schnellen Überblick über anstehende Reminder und lässt die User die verschiedenen Profile aufrufen. Die Profil Page dient zum Einsehen vorhandener Profile und erstellen Neuer. Die Reminder Page zeigt alle Reminder an  und lässt den User Weitere erstellen.

## 1. Entwicklungsprozess
### Jira
Um eine einfachere Projektplanung durchzuführen, wurde das Tool Jira verwendet. Dort konnte das Projekt in kleinere Teilprojekte zerlegt werden und iterativ daran gearbeitet werden. Aufgeteilt wurde zwischen Front- und Backend. Dort wurden dann jeweils eigene Tasks spezifiziert, welche um weitere Untertasks erweitert werden können. Ziel war es nach der Anforderungsanalyse die Tasks zuzuweisen. So konnte jeder einen Task abschließen, sobald die Anforderungen erfüllt wurden. Zur Orientierung haben wir aber hauptsächlich Miro verwendet. Besonders beim Design haben wir versucht, die vordefinierten Wireframes zu verwenden. Bei der Erstellung der Wireframes haben wir bereits darauf geachtet, so viel wie möglich mit Flutter Widgets zu arbeiten. Aufgrund der guten Dokumentation der Widgets und deren Implementation in Flutter ist uns die Frontendentwicklung größtenteils leicht gefallen.
Bei der Backendentwicklung gab es größere Probleme: Um Push-Benachrichtigungen auf Android zu versenden, benötigt Flutter das Tool Firebase. Leider hat die Integration in das Projekt mit Firebase nicht funktioniert, sodass wir auf die Benachrichtigungen verzichten mussten. Die Erstellung des Firebase Projektes hat zwar noch funktioniert, bei der Umsetzung der Reminder sind wir jedoch leider nicht weitergekommen. Weiter unten wird jedoch auf das Paket local_notifications weiter eingegangen.
                                                            


### Gitflow
Als Git-Branching-Modell wurde der Gitflow angewandt. Für jedes neue Feature wurde ein Branch erstellt, der nach Abschluss des Tasks wieder in den Master gemerged wurde. So konnte an mehreren Features unabhängig voneinander gearbeitet werden.

### Git Naming Convention
Um eine bessere Übersicht über die Commits zu behalten, wurde ein Naming Convention festgelegt.

branch-name: commit-message

Bei einem Bugfix wird zusätzlich noch ein Präfix angefügt.

branch-name: fix: commit-message

So kann man auch nach dem Mergen die Commits zu den Features zuweisen. Ebenso werden Bugfixes schneller gefunden.




## 2. Architektur
### MVC+S
Für die Architektur wurde ein Model-View-Controller Ansatz gewählt. So hat man für jede Seite ein in sich geschlossenes System, welches über Serviceklassen kommunizieren kann. Für jede Page wird also ein eigenes MVC Pattern angewandt. Zwischen den drei Klassen wir das Dependency Inversion Prinzip verwendet, sodass die Klassen jeweils direkt von abstrakten Interfaces abhängen und nicht von Implementationen. Um die Model Klassen der Seiten zu erstellen wurde das Tool freezed verwendet. Dazu mussten nur die Datentypen spezifiziert werden, die das Model enthält. Anschließen konnte durch einen command die Modelklasse mit Gettern und Settern sowie Konstruktor ganz einfach generiert werden.

### State-Management mit Riverpod
Um den State der App zu managen, wurde die externe Bibliothek Riverpod eingebunden. Da in der App alles von den Profilen abhängt, benötigen wir für die Hauptfunktionalität nur einen Provider. Um die verschiedenen Reminder zu managen verwenden wir Riverpod Family, wie auch im Vorlesungscode vorgegeben. Über diesen Provider können verschiedene Seiten der App auf alle Reminder zugreifen und diese bearbeiten. Als Basis wird das CreationPageModel verwendet, die Daten für Reminder enthält. Über den Controller lassen sich dann neue Reminder erstellen und einer Liste hinzufügen.
Alle Seiten, die Reminder beinhalten, müssen also auf diesen Provider zugreifen.


## 3. Datenpersistenz
Für die Datenpersistenz wurde die lokale Datenbank Hive verwendet. Es wurde eine Datenbank erstellt, die die angelegten Profile mit den zugehörigen Remindern persistiert. 

## 4. Schnittstellen
Da wir keinen Online Service anbieten wollen und die Daten lokal mit Hive gespeichert haben, bestand keine Notwendigkeit, eine REST Schnittstelle zu implementieren.


### Weitere Packages
Um lokale Benachrichtigungen anzeigen zu lassen wird das Package flutter_local_notifications verwendet. Damit können sowohl für Android, als auch iOS Erinnerungen erstellt werden. Zusätzlich wird das Paket rxdart eingebunden, um die Stream Funktionalitäten zu erweitern und mit Observables besser zu arbeiten.

### Animationen

#### SliverAppBar
Mit der SliverAppBar in Verbindung mit FlexibleSpaceBar konnte ein dynamisches Scrollen ermöglicht werden, welches das Startbild auf dem Homescreen überdeckt.

#### Dismissible
Das Dismissible Widget wird verwendet um Profile und Reminder, durch Ziehen in die angegebene Richtung, zu löschen. Das Ziehen des Widgets in die DismissDirection bewirkt, dass das Kind aus der Ansicht gleitet. 


# References

<a id=1>[SDZ]</a> 
Süddeutsche Zeitung 2011. https://www.sueddeutsche.de/gesundheit/medikamente-nein-meine-pille-ess-ich-nicht-1.1066400


