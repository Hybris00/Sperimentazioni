# Sperimentazioni

Questa libreria vuole fornire a studenti che frequentino corsi di Sperimentazioni di Fisica o che ne abbiano bisogno, delle funzioni comprensibili e utili per alleggerire il già pesante carico di studi.

## Tabella dei contenuti

1. [Funzioni Comprese](#funzioni-comprese)

## Funzioni comprese

Questa libreria contiene le seguenti funzioni:

- [Compatibilità](#compatibility)
- [Interpolazione Lineare](#interpolazione-lineare)
- [Chi Quadro](#chi-quadro)
- [Grafico Dei Residui](#plotta-residui)
- [Media Pesata](#media-pesata)

### Compatibility

La funzione Compatibility calcola la compatibilità e ne restituisce il valore o l'eventuale matrice di Compatibilità. Si utilizza in questo modo:

```
 Compatibility(X,Y,sigmax,sigmay)
```

La funzione richiede che gli input siano vettori colonna. La formula usata è: $$ \lambda = \frac{|X - Y|}{\sqrt{sigmax^2 + sigmay^2}} $$

### Interpolazione Lineare

### Chi Quadro

La funzione Chi Quadro calcola il Chi Quadro con il metodo più generale possibile e ne resituisce il valore. Si utilizza in questo modo:

```
ChiQuadro(Osservati, Attesi, sigmaOsservati)
```

Il valore viene calcolato con questa formula: $$ \chi^{(2)} = \left(\frac{Osservati - Attesi}{sigmaOsservati}\right)^2 $$

### Plotta Residui
