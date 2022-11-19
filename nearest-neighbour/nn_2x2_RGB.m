% Profeanu Ioana, 313CA
function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB.
    % =========================================================================

    % extrage canalul rosu al imaginii
    red_points = img(:,:,1);
    
    % extrage canalul verde al imaginii
    green_points = img(:,:,2);
    
    % extrage canalul albastru al imaginii
    blue_points = img(:,:,3);

    % aplica functia nn pe cele 3 canale ale imaginii
    red_matrix = nn_2x2(red_points, STEP);
    green_matrix = nn_2x2(green_points, STEP);
    blue_matrix = nn_2x2(blue_points, STEP);
 
    % formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, red_matrix, green_matrix, blue_matrix);
    
endfunction
