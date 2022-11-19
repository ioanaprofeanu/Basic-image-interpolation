% Profeanu Ioana, 313CA
function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    
    % obtine dimensiunea imaginii
    [m n nr_colors] = size(I);
    
    % cast matricii I la double
    I = double(I);

    % calculeaza matricea cu derivate fata de x Ix, data de y Iy,
    % fata de xy Ixy parcurgand matricea I
    % daca pixelul se afla la marginea imaginii, derivata va fi 0

    Ix = zeros(m, n);
    Iy = zeros(m, n);
    Ixy = zeros(m, n);
    
    for y = 1 : m
        for x = 1 : n
          if x == 1 || x == n
            Ix(y, x) = 0;
          else
            Ix(y, x) = fx(I, x, y);
          endif
          
          if y == 1 || y == m
            Iy(y, x) = 0;
          else
            Iy(y, x) = fy(I, x, y);
          endif
          
          if x == 1 || x == n || y == 1 || y == m
            Ixy(y, x) = 0;
          else
            Ixy(y, x) = fxy(I, x, y);
          endif
       endfor
    endfor

endfunction
