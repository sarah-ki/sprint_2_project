# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Funktionale Anforderungen
-------------------------

* CreateReadUpdateDelete (CRUD) eines Wortes/ Wortgruppe mit
  Validierung (maximale Anzahl, Leerzeichen am Anfang und Ende
  entfernen, Uniqueness ...)
* Listendarstellung der angelegten Wörter (mit Paging und Filterung:
  by voting, angelegt am, angelegt von ...)
* kleine Nutzerverwaltung (Email, Passwort, Confirmation Mails)
* Anmeldung anhand von Email und Passwort
* E-Mail wenn Wort erstellt wurde
* Einträge können gevotet werden
* Suche von Einträgen (Autocompletion)
* mit Ajax "aufhübschen"
* Admin-Interface zur Nutzerverwaltung (z.B. deaktivieren von Nutzern)
* Statistik-Modul: Klicks, Votes ...
* Wörter können getaggt werden (mit TagCloud)

Nicht-Funktionale Anforderungen
------------------------------

* Nutzung eines MVC-Frameworks (Model-View-Controller)
* RESTful
* Test-Driven-Development (TDD)
* Sicherheit (SQL-Injections, XSS, ...)
* Apache/Nginx-Config bauen
* Benchmarks
* einigermaßen akzeptables User-Interface (HTML/CSS)
* gehashte Passwörter (bcrypt2)
* Mysql oder PostgreSQL

Allgemeines
-----------

Zur Evaluierung der umgesetzten Lösung benötigen wir am Ende die
folgenden Informationen:

* Zeitenerfassung (getrennt nach Tätigkeiten: Konzeption (z.B.: Datenbank-Schema), Entwicklung, Design/HTML )
