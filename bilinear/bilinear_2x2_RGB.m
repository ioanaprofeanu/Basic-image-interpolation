% Profeanu Ioana, 313CA
function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 img cu puncte intermediare
    % echidistante, cu precizarea ca img este o imagine colorata RGB.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Practic, apeleaza bilinear_2x2_interpolation pe fiecare canal al imaginii
    % img si reconstruieste imaginea colorata la final
    % Parametrii:
    % - img = imaginea 2x2 RGB care doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================

    % extrage canalul rosu al imaginii
    red_points = img(:,:,1);
    
    % extrage canalul verde al imaginii
    green_points = img(:,:,2);
    
    % extrage canalul albastru al imaginii
    blue_points = img(:,:,3);

    % aplica bilinear_2x2_interpolation pe fiecare dintre canale
    red_matrix = bilinear_2x2(red_points, STEP);
    green_matrix = bilinear_2x2(green_points, STEP);
    blue_matrix = bilinear_2x2(blue_points, STEP);
    
    % combina rezultatul in imaginea finala
    out = cat(3, red_matrix, green_matrix, blue_matrix);

endfunction
