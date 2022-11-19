% Profeanu Ioana, 313CA
function out = nn_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest-neighbour pe imaginea 2x2 f cu puncte
    % intermediare echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================
    
    % defineste coordonatele x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;

    % afla nr. de puncte
    n = length(x_int);

    % cele 4 punctele incadratoare vor fi aceleasi pentru toate punctele din
    % interior
    x1 = y1 = 1;
    x2 = y2 = 2;

    % initializeaza rezultatul cu o matrice n x n plina de zero
    out = zeros(n, n);

    % parcurge fiecare pixel din imaginea finala
    for i = 1 : n
        for j = 1 : n
            % afla cel mai apropiat pixel din imaginea initiala
            x_coordinate = round(x_int(j));
            y_coordinate = round(y_int(i));
            
            % calculeaza pixelul din imaginea finala
            pixel = f(x_coordinate, y_coordinate);
            out(j, i) = pixel;
        endfor
    endfor

endfunction
