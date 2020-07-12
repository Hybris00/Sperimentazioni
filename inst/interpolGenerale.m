## -*- texinfo -*-## Funzione che effettua l'interpolazione lineare, restituendo il valore di a,b coi relativi errori## e ne plotta e salva il grafico.@*## Accetta diverse opzioni di personalizzazione del grafico e della funzione quale: @*## labelx, labely, titolo che accettano stringhe @*## stampa che accetta il valore 0,1 per salvare il plot (default 1, che salva) @*## generale che accetta il valore 0,1 per effettuare l'interpolazione con sigma tutti uguali. (Default = 0,sigma tutti uguali) @*## logging che accetta il valore 0,1 per stampare a schermo i valori calcolati (dafault 0, non stampa)function [a, b,sigma_a,sigma_b] = interpolGenerale(X,Y,sigma,OPTIONS = {})    # Definisco le opzioni  OPTIONS = cell2struct(OPTIONS(2:2:length(OPTIONS))',OPTIONS(1:2:length(OPTIONS)));  try    labelx = OPTIONS.labelx;  catch    labelx = "X";  end_try_catch    try    stampa = OPTIONS.stampa;  catch    stampa = 1;  end_try_catch    try     labely = OPTIONS.labely;  catch    labely = "Y";  end_try_catch    try    name = OPTIONS.name;  catch    name = "GenericaInterpolazione";  end_try_catch    try    Generale = OPTIONS.generale;  catch    Generale = 0;  end_try_catch    try    logging = OPTIONS.logging;  catch    logging = 0;  end_try_catch    try    titolo = OPTIONS.titolo;  catch    titolo = "Titolo Generico"  end_try_catch    # Definisco le variabili importanti e sistemo gli input  X = X(:);  Y = Y(:);  sigma = sigma(:);  N = length(X);    #Inizio i calcoli dell'interpolazione  if(Generale == 1)    delta = (sum(1./(sigma.^2)))*(sum((X.^2)./(sigma.^2))) - (sum((X)./(sigma.^2)))^2;    a = (1/delta)*(((sum((X.^2)./(sigma.^2)))*sum(Y./(sigma.^2))) - (sum(X./(sigma.^2)))*(sum((X.*Y)./(sigma.^2))));    b = (1/delta)*((sum(1./(sigma.^2)))*sum((X.*Y)./(sigma.^2)) - sum(X./(sigma.^2))*sum(Y./(sigma.^2)));    sigma_a = sqrt((1/delta)*(sum((X.^2)./(sigma.^2))));    sigma_b = sqrt((1/delta)*(sum(1./(sigma.^2))));    sigma_y = sigma;  else    delta = N*sum(X.^2) - (sum(X))^2;    a = (1/delta)*((sum(X.^2))*sum(Y) - sum(X)*sum(X'*Y));    b = (1/delta)*(N*sum(X'*Y) - sum(X)*sum(Y));    sigma_y = sqrt(sum((Y - a - b*X).^2)/(N-2));    sigma_a = (sigma_y)*sqrt((sum(X.^2))/(delta));    sigma_b = (sigma_y)*sqrt(N/delta);    sigma_y = ones(size(X)).*sigma_y;  endif    sigma_y_post = sqrt(sum((Y - a - b*X).^2)/(N-2));    #Plotto il grafico  plot(X,a+b*X,"b");  hold on;  errorbar(X',Y',sigma_y', ".r");  scatter(X',Y',"r")    #Setto le opzioni  set(gca,"fontsize", 8);  ylabel(labely,"fontsize",15);  xlabel(labelx,"fontsize",15);  title(titolo);  grid;    #Salvo il grafico  if(stampa == 1)    try      name = ["Images/" name];      print(name);    catch      name = ["GenericaInterpolazione.pdf"];      print(name);    end_try_catch  else  endif  hold off;    # Printo i valori se l'opzione logging è attiva  if (logging == 1)    printf("I valori calcolati sono: \n a = %d +- %d \n b = %d +- %d \n I primi 5 valori di sigmay = [%d,%d,%d,%d,%d]", a,sigma_a,b,sigma_b,sigma_y(1:5));
  endifendfunction
