function end_imagem = funcao3 (p)
% função R² -> R³ que monta uma imagem utilizando uma função que não é de classe C²
% f(x,y) = ( -x²/2 (se x <= 0) ou x²/2 (se x > 0),
%             x²/2 - y²/2,
%            -y²/2 (se y <= 0) ou y²/2, (se y > 0) )
  
  x_ = y_ = 0; % recebem valores de 4 a 8
  x0 = 4;
  y0= 4;
  
  h = 4;
  d = h/(p-1);
  fmax = 32;
  fmin = -32;
  
  for x = 1:p
    for y = 1:p
      if (x <= 0)
        img(x,y,1) = (-x_**2/2 - fmin)/(fmax -fmin) * 255;
      else
        img(x,y,1) = (x_**2/2 - fmin)/(fmax -fmin) * 255;
      endif
      img(x,y,2) = (x_**2/2 - y_**2/2 - fmin)/(fmax -fmin) * 255;
      if (y <= 0)
        img(x,y,3) = (-y_**2/2 - fmin)/(fmax -fmin) * 255;
      else
        img(x,y,3) = (y_**2/2 - fmin)/(fmax -fmin) * 255;
      endif
      y_ = y0 + y * d;
    endfor
    x_ = x0 + x * d;
  endfor
  
  img = uint8(img);
  end_imagem = "f_img.png";
  imwrite (img, end_imagem, "Quality", 100);
endfunction