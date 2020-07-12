## -*- texinfo -*-
## La funzione ChiQuadro effettua un test del Chi Quadro generale.
## UTILIZZO: ChiQuadro(Osservati, Attesi, sigmaOsservati)
## Restituisce il valore del Chi Quadro.
##Il ChiQuadro viene calcolato facendo: Sum [(Osservati - Attesi)/(sigmaOsservati)]^2
##Si richiede che i valori in input siano vettori della stessa misura.
function [Chi] = ChiQuadro(Osservati,Attesi,sigmaOsservati)  Chi = sum((((Osservati - Attesi))./(sigmaOsservati)).^2);
endfunction
