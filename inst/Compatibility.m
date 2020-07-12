## -*- texinfo -*-
## La funzione Compatibility calcola la compatibilità e ne restituisce il valore o l'eventuale matrice di Compatibilità.
## Si utilizza in questo modo:
## Compatibility(X,Y,sigmax,sigmay)
## La funzione richiede che gli input siano vettori
function [lambda] = Compatibility(X,Y,sigmax,sigmay)
  [rx,cx] = size(X);
  [ry,cy] = size(Y);
  if (cx != 1)
    X  = reshape(X, cx,rx);
    sigmax = reshape(sigmax,cx,rx);
  endif
  if (cy != 1)
    Y = reshape(Y,cy,ry);
    sigmay = reshape(sigmay,cy,ry);
  endif  CMatrix = (Y * ones(size(X))') - X';
  SMatrix = (sigmay.^2 * ones(size(sigmax))') + sigmax.^2';
  lambda = abs(CMatrix./sqrt(SMatrix));
endfunction
