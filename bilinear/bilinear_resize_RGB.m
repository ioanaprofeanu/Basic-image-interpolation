% Profeanu Ioana, 313CA
function out = bilinear_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % extrage canalul rosu al imaginii
    red_points = img(:,:,1);
    
    % extrage canalul verde al imaginii
    green_points = img(:,:,2);
    
    % extrage canalul albastru al imaginii
    blue_points = img(:,:,3);

    % aplica functia nn pe cele 3 canale ale imaginii
    red_matrix = bilinear_resize(red_points, p, q);
    green_matrix = bilinear_resize(green_points, p, q);
    blue_matrix = bilinear_resize(blue_points, p, q);

    % formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, red_matrix, green_matrix, blue_matrix);

endfunction