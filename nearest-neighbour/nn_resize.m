% Profeanu Ioana, 313CA
function R = nn_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare nearest-neighbour
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % ignora imagini care nu sunt alb negru
    if nr_colors > 1
        R = -1;
        return
    endif
    
    % cast I la double
    I = double(I);
    
    % initializeaza matricea finala
    R = zeros(p, q);

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!

    % calculeaza factorii de scalare
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);

    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
            % aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            % x_0 = x_i * s_x
            % y_0 = y_i * s_y
            x_p = x / s_x;
            y_p = y / s_y;

            % trece (x_p, y_p) si (x, y) din sistemul de coordonate de la 0 la
            % n - 1 in sistemul de coordonate de la 1 la n pentru a aplica 
            % interpolarea
            new_x = x + 1;
            new_y = y + 1;
            x_p = x_p + 1;
            y_p = y_p + 1;

            % calculeaza cel mai apropiat vecin
            x_coordinate = round(x_p);
            y_coordinate = round(y_p);
            
            % calculeaza valoarea pixelului din imaginea finala
            pixel = I(y_coordinate, x_coordinate);
            R(new_y, new_x) = pixel;
        endfor
    endfor

    % TODO: converteste matricea rezultat la uint8
    R = uint8(R);
endfunction
