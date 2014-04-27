-module (ex2).
-export([testGesamtpreisliste/0]).
-export([berechneGesamtpreisliste/1]).
-export([gebenGesamtpreislisteAus/1]).


gebenGesamtpreislisteAus(Liste)-> berechneGesamtpreisliste(Liste).

berechneGesamtpreisliste(Liste) ->[{Produkt,Preis*Menge}||{Produkt,Menge,Preis} <- Liste].

testGesamtpreisliste() -> gebenGesamtpreislisteAus([{buch,2,1.2},{film,1,2.4},{cd,4,2}]).