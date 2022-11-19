% Profeanu Ioana, 313CA
function out = bicubic_resize_RGB(img, p, q)
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
    red_matrix = bicubic_resize(red_points, p, q);
    green_matrix = bicubic_resize(green_points, p, q);
    blue_matrix = bicubic_resize(blue_points, p, q);

    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    out = cat(3, red_matrix, green_matrix, blue_matrix);

endfunction